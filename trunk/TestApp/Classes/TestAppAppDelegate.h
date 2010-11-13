//
//  TestAppAppDelegate.h
//  TestApp
//
//  Created by Vikas Aggarwal on 11/5/10.
//  Copyright 2010 Sakiv Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
