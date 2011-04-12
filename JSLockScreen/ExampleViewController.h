//
//  JSLockScreenViewController.h
//  JSLockScreen
//
//  Created by James on 12/04/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSLockScreenViewController.h"

@interface ExampleViewController : UIViewController <JSLockScreenDelegate> {
    
	UILabel *statusLabel;
	
	JSLockScreenViewController *_lockScreenViewController;
}

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;

- (IBAction)unlock:(id)sender;

@end
