//
//  ADMReaderViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMReaderViewController.h"

@interface ADMReaderViewController ()

@end

@implementation ADMReaderViewController

-(id) initWithmodel:(ADMNew *) model{
    
    if(self = [super init]){
        _model = model;
        self.titleLabel.text  = model.titleText;
        //self.navigationController.navigationItem.title = model.titleText;
        self.authorLabel.text = model.author;
        self.textLabel.text   = model.textContent;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self syncWithModel];
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                         action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    self.ratingViewLabel.text = @"Rate to see rating";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) syncWithModel{
    
    self.titleLabel.text = self.model.titleText;
    self.authorLabel.text = self.model.author;
    self.textLabel.text = self.model.textContent;
    self.textLabel.editable = NO;
    if(self.model.photo){
        PFFile *photoCloudFile = self.model[@"photo"];
        NSData *imageData = [photoCloudFile getData];
        self.articleImage.image = [UIImage imageWithData:imageData];
    }
    self.latitudeLabel.text  = [self.model.latitude stringValue];
    self.longitudeLabel.text = [self.model.longitude stringValue];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //If somebody click the return button
    [textField resignFirstResponder];
    return YES; // key oard dissapaear
}

-(void)dismissKeyboard{
    [self.rateTextField resignFirstResponder];
}


#pragma mark - Rating

-(IBAction)rateButton:(id)sender{
   
    int number = [self.model.ratingNumber intValue];
    number++;
    self.model.ratingNumber = @(number);
    
    int value = [self.model.rating intValue];
    value += [self.rateTextField.text intValue];
    self.model.rating = @(value);
    
    //sync Rating
    NSNumber *numberNS = [NSNumber numberWithDouble:(double) value/number];
    self.ratingViewLabel.text = [numberNS stringValue];
    
    //Update cloud base
    [self.model saveInBackground];
}

@end
