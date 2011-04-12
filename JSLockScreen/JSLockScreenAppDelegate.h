//
//  JSLockScreenAppDelegate.h
//  JSLockScreen
//
//  Created by James on 12/04/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExampleViewController;

@interface JSLockScreenAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ExampleViewController *viewController;

@end
