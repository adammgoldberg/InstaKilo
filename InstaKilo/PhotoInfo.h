//
//  PhotoInfo.h
//  InstaKilo
//
//  Created by Adam Goldberg on 2015-10-14.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoInfo : NSObject

@property (nonatomic, strong) NSString *group;

//@property (nonatomic, strong) NSArray *groupList;

@property (nonatomic, strong) NSString *location;

@property (nonatomic, strong) NSArray *locationList;

@property (nonatomic, strong) UIImage *imageName;

- (instancetype)initWithGroup:(NSString*)group location:(NSString*)location image:(UIImage*)imagename;

@end
