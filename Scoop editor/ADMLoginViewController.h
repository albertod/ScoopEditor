//
//  ADMLoginViewController.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ADMLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *screenTitle;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *passLabel;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UILabel *incorrectCredentialsLabel;

- (IBAction)logInButton:(id)sender;
- (IBAction)readButton:(id)sender;

@end
