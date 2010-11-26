//
//  Proxy.m
//  TestApp
//
//  Created by Vikas Aggarwal on 11/25/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import "Proxy.h"

NSURL *url;


@implementation Proxy

- (void) initWithUrl:(NSString *)urlWithString {
	
	url = [NSURL URLWithString:urlWithString];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];	
}

- (id) invoke:(NSString *)methodName {	
		
}

- (id) invoke:(NSString *)methodName array:(NSArray *)params {	
	
}

@end
