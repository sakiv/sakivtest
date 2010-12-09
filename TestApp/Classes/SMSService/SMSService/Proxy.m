//
//  Proxy.m
//  TestApp
//
//  Created by Vikas Aggarwal on 11/25/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import "Proxy.h"

@implementation Proxy


- (id) invoke:(NSString *) endPoint
message:(NSString *) message
headers:(NSDictionary *) headers
httpMethod:(NSString *) httpMethod
{	
				
	NSURL *url = [NSURL URLWithString:endPoint];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [message length]];   

	for (NSString *key in headers) {
		[request addValue:[headers objectForKey:key] forHTTPHeaderField:key];
	}
	[request addValue:msgLength forHTTPHeaderField:@"Content-Length"];  
    [request setHTTPMethod:httpMethod];       
    [request setHTTPBody: [message dataUsingEncoding:NSUTF8StringEncoding]];  
	
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];  
	
    if(theConnection) {  
        webData = [[NSMutableData data] retain];  
    }  
    else {  
        NSLog(@"theConnection is NULL");  
    }  
	
	return webData;
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[webData setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[webData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	[webData release];
	
	NSLog(@"Connection Error Occered.");
	NSLog(@"Error Code: %@", [error code]);
	NSLog(@"Details: %@", [error description]);
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {

	NSLog(@"Data Received:");
	NSString *xmlData = [[NSString alloc] initWithBytes:webData length:[webData length] encoding:NSISOLatin1StringEncoding];
	
	NSLog(xmlData);	
	[xmlData release];
	
	if(xmlParser){
		[xmlParser release];
	}
	
	xmlParser = [[NSXMLParser alloc] initWithData:webData];
	[xmlParser setDelegate:self];
	[xmlParser setShouldResolveExternalEntities:YES];
	[xmlParser parse];
	
	[connection release];
	[webData release];
	
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

	if([elementName hasSuffix:@"sendSMSToManyResponse"]) {
		if(!soapResults) {
			soapResults = [[NSMutableString alloc] init];
		}
		recordResults = TRUE;
	}
	
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(recordResults) {
		[soapResults appendString:string];
	}

}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName hasSuffix:@"sendSMSToManyResponse"]) {
		NSLog(soapResults);
		[soapResults release];
		soapResults = nil;
		
		recordResults = FALSE;
	}
	
}

@end
