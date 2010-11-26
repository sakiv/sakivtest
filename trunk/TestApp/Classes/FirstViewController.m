//
//  FirstViewController.m
//  TestApp
//
//  Created by Vikas Aggarwal on 11/5/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
//	scrollView = [[scrollView alloc] initWithFrame:self.view.bounds];
//	scrollView.delegate = self;
	
	btnSend.enabled = FALSE;
}

- (IBAction) backgroundTouch:(id)sender {
	
	[txtUID resignFirstResponder];
	[txtPhone resignFirstResponder];
	[txtMessage resignFirstResponder];
	
}

- (IBAction) valueChanged:(id)sender {
	
	NSLog(@"UID:%@", txtUID.text);
	NSLog(@"Phone:%@", txtPhone.text);
	NSLog(@"Message:%@", txtMessage.text);
			
	if ([txtUID.text length] == 0 && [txtPhone.text length] == 0 && [txtMessage.text length] == 0) {
		btnSend.enabled = FALSE;
	}else {
		btnSend.enabled = TRUE;
	}

}

- (IBAction) btnCancel_Click:(id)sender {
	
	txtPhone.text = nil;
	txtUID.text = nil;
	txtMessage.text = nil;
	btnSend.enabled = FALSE;
	
}

- (IBAction) btnSend_Click:(id)sender {
	
}

- (void)textViewDidChange:(UITextView *)textView {
	[self valueChanged:textView];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
