//
//  ChainOfDelegatesViewController.h
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChainOfDelegates.h"

@interface ChainOfDelegatesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
	IBOutlet UILabel *theLabelA;
	IBOutlet UILabel *theLabelB;
	IBOutlet UITextField *theTextField;
	IBOutlet UITableView *theTableView;
	
	ChainOfDelegates* chain;
}

@end
