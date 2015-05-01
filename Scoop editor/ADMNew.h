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
@property (nonatomic,strong) NSData   *photo;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *longitude;
@property (nonatomic,strong) NSString *publicated;
@property (nonatomic,strong) NSNumber *rating;
@property (nonatomic,strong) NSNumber *ratingNumber;

+(NSString *)parseClassName;

@end
