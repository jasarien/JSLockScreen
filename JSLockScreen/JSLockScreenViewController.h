//
//  JSLockScreenViewController.h
//  JSLockScreen
//
//  Created by James on 21/03/2011.
//  Copyright 2011 JamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSLockScreenViewController;

@protocol JSLockScreenDelegate <NSObject>

- (void)lockScreenDidUnlock:(JSLockScreenViewController *)lockScreen;

@optional
- (void)lockScreenFailedUnlock:(JSLockScreenViewController *)lockScreen;
- (void)lockScreenDidCancel:(JSLockScreenViewController *)lockScreen;
- (void)lockScreenDidDismiss:(JSLockScreenViewController *)lockScreen;

@end

@interface JSLockScreenViewController : UIViewController <UITextFieldDelegate> {
	
	UIView *_background;
	
	UIImageView *_headerView;
	UILabel *_statusLabel;
	UILabel *_tipLabel;
	
	UIImageView *_lockView;
	UITextField *_passcodeField;
	UITextField *_firstField;
	UITextField *_secondField;
	UITextField *_thirdField;
	UITextField *_fourthField;
	
	UITapGestureRecognizer *_tap;
	
	id <JSLockScreenDelegate> _delegate;
	
	UIStatusBarStyle _originalStatusStyle;
}

@property (nonatomic, assign) id <JSLockScreenDelegate> delegate;

- (id)initWithDelegate:(id <JSLockScreenDelegate>)delegate;

- (void)showInWindow:(UIWindow *)window;

@end
