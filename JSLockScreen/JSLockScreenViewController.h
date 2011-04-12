//
//  JSLockScreenViewController.h
//  JSLockScreen
//
//  Copyright (c) 2011, James Addyman, JamSoft All rights reserved.
//	
//	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//	
//	Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//	Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//	Neither the name of the nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
//	STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
