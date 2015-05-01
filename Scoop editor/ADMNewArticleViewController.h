//
//  ADMNewArticleViewController.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADMNew.h"

@interface ADMNewArticleViewController : UIViewController <UITextFieldDelegate,CLLocationManagerDelegate>

@property (strong,nonatomic) ADMNew *model;

//View Properties
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *missingTitleLabelWarning;
@property (weak, nonatomic) IBOutlet UILabel *missingContentLabelWarning;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (strong,nonatomic) PFUser *userLogged;

- (IBAction)photoUploadButton:(id)sender;
-(IBAction)uploadButton:(id)sender;
-(id) initWithUser:(PFUser *) user;




@end
