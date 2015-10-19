//
//  PhotoCollection.h
//  InstaKilo
//
//  Created by Adam Goldberg on 2015-10-14.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Modes) {
    kGroupMode,
    kLocationMode
    
};


@interface PhotoCollection : NSObject






@property (nonatomic, strong) NSArray *photosArray;

-(instancetype)initWithPhotos:(NSArray*)photos;

-(NSArray*)groupSections;

-(NSArray*)locationSections;

-(NSArray*)photosForGroup:(NSString*)photoString;
-(NSArray*)photosForLocation:(NSString *)string;

@end
