//
//  FirstViewController.h
//  TestApp
//
//  Created by Vikas Aggarwal on 11/5/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController <UITextViewDelegate> {

	IBOutlet UITextField *txtUID;
	IBOutlet UITextField *txtPhone;
	IBOutlet UITextView *txtMessage;
	IBOutlet UIBarButtonItem *btnSend;	
	IBOutlet UIBarButtonItem *btnCancel;
	
}

// View+Button Events
- (IBAction) backgroundTouch:(id)sender;

// TextBox Events
- (IBAction) valueChanged:(id)sender;

// Button Events
- (IBAction) btnCancel_Click:(id)sender;
- (IBAction) btnSend_Click:(id)sender;

@end
