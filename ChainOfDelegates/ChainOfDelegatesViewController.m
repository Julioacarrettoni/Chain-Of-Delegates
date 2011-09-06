//
//  ChainOfDelegatesViewController.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChainOfDelegatesViewController.h"
#import "Puppet.h"
@implementation ChainOfDelegatesViewController

- (void)dealloc
{
	[chain release];
    [theTextField release];
    [theLabelA release];
    [theLabelB release];
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
	
	chain = [[ChainOfDelegates alloc] init];
	
	[chain addDelegateToChain:self];
	[chain addDelegateToChain: [[Puppet new] autorelease] ];
	
	[chain setAsDelegateForObject:theTableView];
}


- (void)viewDidUnload
{
    [theTextField release];
    theTextField = nil;
    [theLabelA release];
    theLabelA = nil;
    [theLabelB release];
    theLabelB = nil;
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
