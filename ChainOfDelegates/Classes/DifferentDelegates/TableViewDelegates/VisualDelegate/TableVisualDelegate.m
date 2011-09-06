//
//  TableVisualDelegate.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableVisualDelegate.h"

@implementation TableVisualDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 42;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return 22;
}

@end
