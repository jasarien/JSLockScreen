//
//  JSLockScreenViewController.m
//  JSLockScreen
//
//  Created by James on 12/04/2011.
//  Copyright 2011 JamSoft. All rights reserved.
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
