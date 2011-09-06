//
//  TableUserInteractionDelegate.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableUserInteractionDelegate.h"

@implementation TableUserInteractionDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString* msg = [NSString stringWithFormat:@"You selected cell number:%d", indexPath.row];
	UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"didSelectRowAtIndexPath" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

@end
