//
//  ADMReaderViewController.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADMNewsReaderTableViewController.h"
#import "ADMNew.h"

@interface ADMReaderViewController : UIViewController <ADMAuthorNewsTableViewControllerDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *textLabel;
@property (strong,nonatomic) ADMNew *model;
@property (weak, nonatomic) IBOutlet UIImageView *articleImage;
@property (weak, nonatomic) IBOutlet UILabel *ratingViewLabel;


- (IBAction)rateButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;

-(id) initWithmodel:(ADMNew *) model;
@end
