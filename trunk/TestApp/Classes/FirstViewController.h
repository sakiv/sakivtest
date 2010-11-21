//
//  FirstViewController.h
//  TestApp
//
//  Created by Vikas Aggarwal on 11/5/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController {

	IBOutlet UITextField *txtUID;
	IBOutlet UITextField *txtPhone;
	IBOutlet UITextView *txtMessage;
	IBOutlet UIButton *btnSend;
	
}

- (IBAction) valueChanged:(id)sender;
- (IBAction) touchDown:(id)sender;

@end
