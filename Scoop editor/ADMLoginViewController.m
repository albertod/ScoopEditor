//
//  ADMLoginViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMLoginViewController.h"
#import "ADMNewArticleViewController.h"
#import "AppDelegate.h"
#import "ADMAuthorNewsTableViewController.h"
@interface ADMLoginViewController ()

@end

@implementation ADMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.incorrectCredentialsLabel.hidden = YES;
//    self.userTextField.layer.borderColor = [[UIColor blackColor] CGColor];
//    self.passTextField.layer.borderColor = [[UIColor blackColor] CGColor];
//    self.userTextField.layer.borderColor = [[UIColor blackColor] CGColor];
//    self.passTextField.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logInButton:(id)sender {
    
    
    NSString *userName = self.userTextField.text;
    NSString *passWord= self.passTextField.text;
    
    [PFUser logInWithUsernameInBackground:userName password:passWord
                                    block:^(PFUser *user, NSError *error)
    {
        if (user == nil) {
            NSLog(@"Log-In non Suscesfull %@",error);
            self.incorrectCredentialsLabel.hidden = NO;
        } else {
        // The login sucess.
            self.incorrectCredentialsLabel.hidden = YES;
            NSLog(@"Welcome user %@",user.username);
            ADMNewArticleViewController *articleVC = [[ADMNewArticleViewController alloc] initWithUser:user];
            ADMAuthorNewsTableViewController *newsTVC = [ADMAuthorNewsTableViewController new];
            
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            appDelegate.tabBarController.viewControllers= @[articleVC,newsTVC];
            [appDelegate.window setRootViewController:appDelegate.tabBarController];
    }
    }];

}

- (IBAction)readButton:(id)sender {
}
@end
