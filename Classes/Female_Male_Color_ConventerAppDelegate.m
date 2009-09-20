//
//  Female_Male_Color_ConventerAppDelegate.m
//  Female-Male Color Conventer
//
//  Created by MacBury on 08-07-29.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "Female_Male_Color_ConventerAppDelegate.h"
#import "colorDataCell.h"

@implementation Female_Male_Color_ConventerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	NSString * pathToUserCopyOfPlist = [[NSBundle mainBundle] pathForResource:@"colorDataList" ofType:@"plist"];
	kolory = [[NSArray alloc] initWithContentsOfFile:pathToUserCopyOfPlist];
	
	filteredListContent = [[NSMutableArray alloc] initWithCapacity: [kolory count]];
	[filteredListContent addObjectsFromArray: kolory];
	
	[pageController setNavigationBarHidden:YES];
	
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	searchBar.showsCancelButton = NO;
	
	[window addSubview:[pageController view]];
    [window makeKeyAndVisible];
	
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return [filteredListContent count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([searchBar isFirstResponder])
		[searchBar resignFirstResponder];
	NSDictionary * color = [filteredListContent objectAtIndex:indexPath.row];
	
	[hexLabel setText:[NSString stringWithFormat:@"HEX: %@", [color objectForKey:@"Geek"]]];
	[colorLabel setText:[color objectForKey:@"Male"]];
	
	colorViewer.navigationItem.title = [color objectForKey:@"Female"];
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
	colorViewer.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	colorViewer.view.backgroundColor = [UIColor colorWithRed:[[color objectForKey:@"Red"] floatValue]
													   green:[[color objectForKey:@"Green"] floatValue]
													    blue:[[color objectForKey:@"Blue"] floatValue]
													   alpha:1.0];
	[pageController pushViewController:colorViewer animated:YES];
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString * id = @"colorDataCell";
	colorDataCell * cell = (colorDataCell *)[tableView dequeueReusableCellWithIdentifier:id];
	NSDictionary * color = [filteredListContent objectAtIndex:indexPath.row];
	
	if (cell == nil) {
		cell = [[[colorDataCell alloc] initWithFrame:CGRectMake(0,0,0,0) reuseIdentifier:id] autorelease];
	}
	
	cell.colorView.backgroundColor = [UIColor colorWithRed:[[color objectForKey:@"Red"] floatValue]
													   green:[[color objectForKey:@"Green"] floatValue]
													    blue:[[color objectForKey:@"Blue"] floatValue]
													   alpha:1.0];
	cell.colorName.text = [color objectForKey:@"Female"];
	//cell.text = [[filteredListContent objectAtIndex:indexPath.row] objectForKey:@"Female"];
	
	return cell;

}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)sb
{
	searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)sb
{
	searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[filteredListContent removeAllObjects];	

	NSDictionary *cell;
	for (cell in kolory)
	{
		NSString * cellTitle = [cell objectForKey:@"Female"];
		
		NSComparisonResult result = [cellTitle compare:searchText options:NSCaseInsensitiveSearch
										range:NSMakeRange(0, [searchText length])];
		if (result == NSOrderedSame)
		{
			[filteredListContent addObject:cell];
		}
	}
	
	[colorTableView reloadData];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)sb
{
	if (searchBar.text.length > 0)
	{
		[filteredListContent removeAllObjects];
		[filteredListContent addObjectsFromArray: kolory];
	}
	
	[colorTableView reloadData];
	
	[searchBar resignFirstResponder];
	searchBar.text = @"";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)sb
{
	[searchBar resignFirstResponder];
}

- (IBAction) showInfo:(id)sender {
	NSString * msg = @"Autor: macbury\n WWW: http://macbury.jogger.pl \nPomysł:pziewiec@gmail.com \nWersja web:http://ania.cc/fmcc/";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"O programie" message:msg
							delegate:self cancelButtonTitle:@"Może być" otherButtonTitles: nil];
	[alert show];	
	[alert release];
}

- (void)dealloc {
	[filteredListContent release];
	[kolory release];
	[window release];
	[super dealloc];
}



@end
