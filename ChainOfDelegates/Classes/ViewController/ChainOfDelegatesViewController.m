//
//  ChainOfDelegatesViewController.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChainOfDelegatesViewController.h"

#import "TableVisualDelegate.h"
#import "TableUserInteractionDelegate.h"
#import "TextFieldVisualDelegate.h"
#import "TextFieldUserInteractionDelegate.h"

@implementation ChainOfDelegatesViewController

- (void)dealloc
{
	[delegatesForTable release];
	[delegatesForTextField release];
    [theTextField release];
	[theTableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//First we create the chain of delegates for the table
	delegatesForTable = [ChainOfDelegates new];
	
	// Now we add the 'master' delegate. MASTER DELEGATE: when a delegate requires a value to be return
	// only the value returned by the master will be used, the others will be ignored (but the methods will be call anyway)
	[delegatesForTable setMasterDelegateOfChain: self];
	//For example, both, self and 'TableVisualDelegate' implements 'tableView:heightForRowAtIndexPath:' 
	//and both get called, but the value returned by 'TableVisualDelegate' is ignored as it is not the
	//master delegate
	
	[delegatesForTable addDelegateToChain: [[TableVisualDelegate new] autorelease] ];
	[delegatesForTable addDelegateToChain: [[TableUserInteractionDelegate new] autorelease] ];
	
	[delegatesForTable setAsDelegateForObject:theTableView];
	
	//Now we do the same for the textField
	delegatesForTextField = [ChainOfDelegates new];
	//As we don't enter any Master, the first one to be entered will be the master delegate
	[delegatesForTextField addDelegateToChain: [[TextFieldUserInteractionDelegate new] autorelease] ];
	[delegatesForTextField addDelegateToChain: [[TextFieldVisualDelegate new] autorelease] ];
	[delegatesForTextField setAsDelegateForObject:theTextField];
	
	//Now we are ready to Rock! :)
	
	//try it, put some breakpoints and you will see how it works.
	
}


- (void)viewDidUnload
{
    [theTextField release];
    theTextField = nil;
	[theTableView release];
	theTableView = nil;
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TABLE THINGS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"header size set on TableVisualDelegate";
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"LALA"];
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"LALA"];
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	int a = 0;
	a = a + 5;
}


@end
