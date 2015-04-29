//
//  ADMNewArticleViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNewArticleViewController.h"
@interface ADMNewArticleViewController ()

@end

@implementation ADMNewArticleViewController



-(id) initWithUser:(PFUser *) user{
    
    if(self = [super init]){
        
        _userLogged = user;
        self.title = @"New Article";
        dispatch_async(dispatch_get_main_queue(), ^{
             self.authorLabel.text = _userLogged.username;
        });
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)uploadButton:(id)sender {
    
    
    self.missingTitleLabelWarning.hidden = YES;
    self.missingContentLabelWarning.hidden = YES;

    //Do checking for every required field, to avoid error
    if([self.titleTextField.text isEqualToString:@""]){
       NSLog(@"Article couldn't be uploade,not title");
        self.missingTitleLabelWarning.hidden = NO;
        return;
    }
    
    if([self.contentText.text isEqualToString:@""]){
      NSLog(@"Article couldn't be uploade,non content");
        self.missingContentLabelWarning.hidden = NO;
        return;
    }
    
    _model = [ADMNew new];
    self.model.author = _userLogged.username;
    self.model.titleText = _titleTextField.text;
    self.model.textContent = _contentText.text;
    self.model.publicated  = @"No-Publicated";
    
    [self.model saveInBackgroundWithBlock:^(BOOL suceeded, NSError *error){
        
        if(suceeded){
            NSLog(@"Article have been upload with success");
        }else{
            NSLog(@"Article couldn't be uploade %@",error);
        }
        
    }];
    
    
    
}
@end
