//
//  PhotoInfo.m
//  InstaKilo
//
//  Created by Adam Goldberg on 2015-10-14.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "PhotoInfo.h"

@implementation PhotoInfo


- (instancetype)initWithGroup:(NSString*)group location:(NSString*)location image:(UIImage*)imagename
{
    self = [super init];
    if (self) {
        self.group = group;
        self.location = location;
        self.imageName = imagename;
    }
    return self;
}





@end
