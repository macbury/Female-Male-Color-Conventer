//
//  colorViewController.m
//  CC
//
//  Created by MacBury on 08-07-28.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "colorViewController.h"


@implementation colorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}


- (void)viewWillDisappear:(BOOL)animated
{	
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewWillAppear:(BOOL)animated
{	
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
