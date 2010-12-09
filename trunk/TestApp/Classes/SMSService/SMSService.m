/*-
 * WSDL stubs for:  http://www.aswinanand.com/sendsms.php?wsdl
 *   Generated by:  sakiv
 *           Date:  Sun Dec  5 15:27:26 2010
 *        Emitter:  Objective-C
 */

#import "SMSService.h"

/*-
 *   Method Name:  sendSMSToMany
 * Documentation:  Sends the same SMS to multiple phone numbers. Give your 10 digit
 *                 phone number for user ID. Separate each phone number with a
 *                 semicolon(';').
 */
@implementation sendSMSToMany

- (id) initWithUrl:(NSString *)urlWithString {
	
	if(self = [super init])
	{	
		url = urlWithString;
	}
	return self;
	
}

- (void) setParameters:(NSString*) in_uid in_pwd:(NSString*) in_pwd in_phone:(NSString*) in_phone in_msg:(NSString*) in_msg {
	
	NSString *path = [[NSBundle mainBundle] pathForResource: @"sendSMSToMany" ofType: @"xml"];   
	NSString *message = [NSString stringWithContentsOfFile: path encoding: NSUTF8StringEncoding error: NULL];	
	soapMessage = [NSString stringWithFormat: message, in_uid, in_pwd, in_phone, in_msg];
	
}

- (id) invoke {
	NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
	[headers setObject:@"deflate" forKey:@"Accept-Encoding"];
	[headers setObject:@"text/xml; charset=utf-8" forKey:@"Content-Type"];
	[headers setObject:@"urn:sms#SendSMSToMany" forKey:@"Soapaction"];  
		
	return [super invoke:url message:soapMessage headers:headers httpMethod:@"POST"];
}

@end; /* sendSMSToMany */



@implementation SendSMSService

+ (id) sendSMSToMany:(NSString*) in_uid in_pwd:(NSString*) in_pwd in_phone:(NSString*) in_phone in_msg:(NSString*) in_msg
{
    id result = NULL;    
    sendSMSToMany* _invocation = [[sendSMSToMany alloc] initWithUrl:@"http://www.aswinanand.com/sendsms.php"];    
    [_invocation setParameters: in_uid in_pwd:in_pwd in_phone:in_phone in_msg:in_msg];    
    result = [[_invocation invoke] retain];    
    [_invocation release];    
    return result;    
}



@end;


/*-
 * End of WSDL document at http://www.aswinanand.com/sendsms.php?wsdl
 */