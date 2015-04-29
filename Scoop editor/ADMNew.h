//
//  ADMNew.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#include <Parse/Parse.h>
@interface ADMNew : PFObject <PFSubclassing>

@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *textContent;
@property (nonatomic,strong) UIImage  *photo;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) PFGeoPoint *cordinates;
@property (nonatomic,strong) NSString *publicated;


+(NSString *)parseClassName;

@end
