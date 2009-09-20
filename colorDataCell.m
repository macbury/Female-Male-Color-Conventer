//
//  colorDataCell.m
//  Female-Male Color Conventer
//
//  Created by MacBury on 08-07-31.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "colorDataCell.h"


@implementation colorDataCell

@synthesize colorView, colorName;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
		colorName = [[UILabel alloc] initWithFrame:CGRectMake(45, 11, 250, 21)];
		colorName.textAlignment = UITextAlignmentLeft;
		colorName.font = [UIFont boldSystemFontOfSize:17.0f];
		colorName.highlightedTextColor = [UIColor whiteColor];
		[self.contentView addSubview:colorName];
		
		colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 43, 43)];
		[self.contentView addSubview:colorView];
		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}


- (void)dealloc {
	[colorName release];
	[super dealloc];
}


@end
