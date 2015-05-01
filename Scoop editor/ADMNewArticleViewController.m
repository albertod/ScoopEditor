//
//  ADMNewArticleViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNewArticleViewController.h"
#import <Parse/Parse.h>
#import "AGTPhotoViewController.h"
#import "ADMPhoto.h"
@interface ADMNewArticleViewController ()

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLLocation *currentLocation;
@property (nonatomic,strong) ADMPhoto *photoModel;

@end

@implementation ADMNewArticleViewController



-(id) initWithUser:(PFUser *) user{
    
    if(self = [super init]){
        
        _userLogged = user;
        self.title = @"New Article";
        _photoModel = [[ADMPhoto alloc]init];
        dispatch_async(dispatch_get_main_queue(), ^{
             self.authorLabel.text = _userLogged.username;
        });
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                         action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    //update location
    [self.locationManager startUpdatingLocation];
}


-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)photoUploadButton:(id)sender {
    
   
    AGTPhotoViewController *pVC = [[AGTPhotoViewController alloc]initWithModel:_photoModel];
    [self.navigationController pushViewController:pVC animated:YES];
}

- (IBAction)uploadButton:(id)sender {
    
    self.missingTitleLabelWarning.hidden = YES;
    self.missingContentLabelWarning.hidden = YES;
    
    //Do checking for every required field, to avoid error
    if([self.titleTextField.text isEqualToString:@""]){
        NSLog(@"Article couldn't be with not title");
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
    self.model.rating = 0;
    
    //If there is a photo
    if(_photoModel.imageData != nil){
        
        PFFile *imageFile = [PFFile fileWithName:@"image.jpg" data:_photoModel.imageData];
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // The image has now been uploaded to Parse. Associate it with a new object
                [self.model setObject:imageFile forKey:@"photo"];
                [self.model saveInBackground];
            }else{
                NSLog(@"Error saving pic %@",error);
            }
        }];
    }
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            self.model.latitude = @([geoPoint latitude]);
            self.model.longitude = @([geoPoint longitude]);
            [self.model saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSLog(@"Saved");
                    
                }
                else{
                    // Error
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }else{
            NSLog(@"Error in GPS");
        }
    }];
    

    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //If somebody click the return button
    [textField resignFirstResponder];
    return YES; // key oard dissapaear 
}

-(void)dismissKeyboard{
    
    [self.contentText resignFirstResponder];
    [self.titleTextField resignFirstResponder];
}

#pragma mark - CLLocation 
-(CLLocationManager *)locationManager{
    
    if(_locationManager == nil){
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
    }
    return _locationManager;
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations{
    
    NSLog(@"Update to new location %@",[locations lastObject]);
    self.currentLocation = [locations lastObject];
    
}



@end
