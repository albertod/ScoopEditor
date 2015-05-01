//
//  ADMPhoto.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 5/1/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMPhoto.h"

@implementation ADMPhoto

-(void) setImage:(UIImage *)image{
    
    // Convertir la UIImage en un NSData
    self.imageData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *) image{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.imageData];
}


@end
