//
//  PhotoCollection.m
//  InstaKilo
//
//  Created by Adam Goldberg on 2015-10-14.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "PhotoCollection.h"
#import "PhotoInfo.h"

@implementation PhotoCollection

- (instancetype)initWithPhotos:(NSArray*)photos
{
    self = [super init];
    if (self) {
        self.photosArray = photos;
    }
    return self;
}


-(NSArray*)groupSections
{
    NSMutableSet *groupSectionsSet = [[NSMutableSet alloc] init];
    for (PhotoInfo *aSection in self.photosArray) {
        [groupSectionsSet addObject:aSection.group];
    }
    NSArray *groupArray = [groupSectionsSet allObjects];

    return [groupArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}


-(NSArray*)locationSections
{
    NSMutableSet *locationSectionSet = [[NSMutableSet alloc] init];
    for (PhotoInfo *aSection in self.photosArray) {
        [locationSectionSet addObject:aSection.location];
    }
    NSArray *locationArray = [locationSectionSet allObjects];
    return [locationArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

-(NSArray*)photosForGroup:(NSString*)photoString
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (PhotoInfo *aPhoto in self.photosArray) {
        if ([photoString isEqualToString:aPhoto.group]) {
            [results addObject:aPhoto];
        }
    }
    return [results copy];
}



-(NSArray*)photosForLocation:(NSString *)string
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (PhotoInfo *aPhoto in self.photosArray) {
        if ([string isEqualToString:aPhoto.location]) {
            [results addObject:aPhoto];
        }
    }
    return [results copy];
}






@end
