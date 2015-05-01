//
//  ADMLoginViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMLoginViewController.h"
#import "ADMNewArticleViewController.h"
#import "ADMAuthorNewsTableViewController.h"
#import "AppDelegate.h"
#import "ADMNewsReaderTableViewController.h"

@interface ADMLoginViewController ()

@end

@implementation ADMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.incorrectCredentialsLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
            [appDelegate.appDNAV pushViewController:appDelegate.tabBarController animated:YES];
            [appDelegate.window setRootViewController:appDelegate.appDNAV];
    }
    }];

}

- (IBAction)readButton:(id)sender {
    
    ADMNewsReaderTableViewController *readerVC = [ADMNewsReaderTableViewController new];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.appDNAV pushViewController:readerVC animated:YES];
}
@end
