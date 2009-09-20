//
//  colorDataCell.h
//  Female-Male Color Conventer
//
//  Created by MacBury on 08-07-31.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface colorDataCell : UITableViewCell {
	UIView * colorView;
	UILabel * colorName;
}

@property (readonly, retain) UIView * colorView;
@property (readonly, retain) UILabel * colorName;

@end
