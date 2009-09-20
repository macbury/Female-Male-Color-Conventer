//
//  Female_Male_Color_ConventerAppDelegate.h
//  Female-Male Color Conventer
//
//  Created by MacBury on 08-07-29.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Female_Male_Color_ConventerViewController;

@interface Female_Male_Color_ConventerAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet UINavigationController*pageController;
	IBOutlet UIViewController * colorViewer;
	IBOutlet UISearchBar * searchBar; 

	IBOutlet UITableView * colorTableView;
	IBOutlet UILabel * hexLabel;
	IBOutlet UILabel * colorLabel;

	NSArray * kolory;
	NSMutableArray * filteredListContent;	
	
	NSMutableDictionary * colorList;
}

- (IBAction) showInfo:(id)sender;

@property (nonatomic, retain) UIWindow *window;

@end

