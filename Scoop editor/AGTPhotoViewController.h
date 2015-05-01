//
//  AGTPhotoViewController.h
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 10/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;

@class ADMPhoto;

@interface AGTPhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
- (IBAction)takePicture:(id)sender;
- (IBAction)deletePhoto:(id)sender;

@property(nonatomic, strong) ADMPhoto *model;

-(id) initWithModel:(ADMPhoto*) model;


@end
