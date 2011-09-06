//
//  TextFieldUserInteractionDelegate.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextFieldUserInteractionDelegate.h"

@implementation TextFieldUserInteractionDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
}

@end
