//
//  JSLockScreenViewController.m
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

#import "ExampleViewController.h"
#import "JSLockScreenViewController.h"
#import "JSLockScreenAppDelegate.h"

@implementation ExampleViewController
@synthesize statusLabel;

- (void)dealloc
{
	[statusLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
	[self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)unlock:(id)sender
{
	_lockScreenViewController = [[JSLockScreenViewController alloc] initWithDelegate:self];
	UIWindow *window = [(JSLockScreenAppDelegate *)[[UIApplication sharedApplication] delegate] window];
	[_lockScreenViewController showInWindow:window];
}

- (void)lockScreenDidUnlock:(JSLockScreenViewController *)lockScreen
{
	[self.statusLabel setText:@"Success!"];
}

- (void)lockScreenFailedUnlock:(JSLockScreenViewController *)lockScreen
{
	[self.statusLabel setText:@"Failure!"];
}

- (void)lockScreenDidCancel:(JSLockScreenViewController *)lockScreen
{
	[self.statusLabel setText:@"Cancelled"];
}

- (void)lockScreenDidDismiss:(JSLockScreenViewController *)lockScreen
{
	[_lockScreenViewController release], _lockScreenViewController = nil;
}

@end
