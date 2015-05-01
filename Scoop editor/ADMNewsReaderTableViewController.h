//
//  ADMNewsReaderTableViewController.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

@import UIKit;
#import "ADMNew.h"

@class ADMNewsReaderTableViewController;

@protocol ADMAuthorNewsTableViewControllerDelegate
@optional

-(void) authorNewsTableViewController:(ADMNewsReaderTableViewController *) newTVC
                        didSelectANew:(ADMNew *) theNew;
@end

@interface ADMNewsReaderTableViewController : UITableViewController

@property (weak,nonatomic) id<ADMAuthorNewsTableViewControllerDelegate> delegate;

@end
