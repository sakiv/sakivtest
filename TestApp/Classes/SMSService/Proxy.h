	//
	//  Proxy.h
	//  TestApp
	//
	//  Created by Vikas Aggarwal on 11/25/10.
	//  Copyright 2010 Sakiv Inc. All rights reserved.
	//

#import <Foundation/Foundation.h>


@interface Proxy : NSObject <NSXMLParserDelegate> {
	
	NSMutableData *webData;
	NSXMLParser *xmlParser;
	NSMutableString *soapResults;
	bool recordResults;
	
} 

- (id) invoke:(NSString *)endPoint message:(NSString *)message headers:(NSDictionary *)headers httpMethod:(NSString *)httpMethod;

@end
