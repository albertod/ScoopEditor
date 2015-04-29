//
//  ADMNew.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/27/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNew.h"
#import <Parse/PFObject+Subclass.h>

@implementation ADMNew

@dynamic titleText;
@dynamic textContent;
@dynamic photo;
@dynamic author;
@dynamic cordinates;
@dynamic publicated;


+(void)load{
    [self registerSubclass];
}

+ (NSString *) parseClassName{
    return @"ADMNew";
}

@end
