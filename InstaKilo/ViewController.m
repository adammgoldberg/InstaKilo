//
//  ViewController.m
//  InstaKilo
//
//  Created by Adam Goldberg on 2015-10-14.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "PhotoInfo.h"
#import "PhotoCollection.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *photoCollectionView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *seg;


@property (nonatomic, strong) NSArray *photos;

@property (nonatomic, strong) NSArray *sectionTitles;

@property (nonatomic, strong) PhotoInfo *photoInfo;

@property (nonatomic, strong) PhotoCollection *photoCollection;



@property (nonatomic, strong) NSArray *groupStrings;






@end

@implementation ViewController


- (IBAction)switchGroupings:(id)sender {
   
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.seg setSelectedSegmentIndex:0];
    
//    self.photoInfo.groupList = @[@"Ski Race", @"Party", @"Mac"];
    
//    self.photoInfo.locationList = @[@"Mountain", @"Club", @"Whistler", @"Vancouver"];
    
    
    
    
    PhotoInfo *firstImage = [[PhotoInfo alloc] initWithGroup:@"Ski Race" location:@"Canada" image:[UIImage imageNamed:@"ski.JPG"]];
    
    PhotoInfo *secondImage = [[PhotoInfo alloc] initWithGroup:@"Friends" location:@"Mountain" image:[UIImage imageNamed:@"ski2.JPG"]];
    
    PhotoInfo *thirdImage = [[PhotoInfo alloc] initWithGroup:@"Ski Race" location:@"Cottage" image:[UIImage imageNamed:@"crowd.JPG"]];
    
    PhotoInfo *fourthImage = [[PhotoInfo alloc] initWithGroup:@"Family" location:@"Club" image:[UIImage imageNamed:@"people.JPG"]];
    
    PhotoInfo *fifthImage = [[PhotoInfo alloc] initWithGroup:@"Party" location:@"House" image:[UIImage imageNamed:@"people2.JPG"]];
    
    PhotoInfo *sixthImage = [[PhotoInfo alloc] initWithGroup:@"Ken" location:@"Cottage" image:[UIImage imageNamed:@"mac.JPG"]];
    
    PhotoInfo *seventhImage = [[PhotoInfo alloc] initWithGroup:@"Adam" location:@"Cottage" image:[UIImage imageNamed:@"mac2.JPG"]];
    
    PhotoInfo *eigthImage = [[PhotoInfo alloc] initWithGroup:@"Ski Race" location:@"Whistler" image:[UIImage imageNamed:@"screen.JPG"]];
    
    PhotoInfo *ninthImage = [[PhotoInfo alloc] initWithGroup:@"Mac" location:@"Club" image:[UIImage imageNamed:@"ski3.JPG"]];
    
    PhotoInfo *tenthImage = [[PhotoInfo alloc] initWithGroup:@"Party" location:@"Vancouver" image:[UIImage imageNamed:@"ski4.JPG"]];
    
    
    self.photos = @[firstImage, secondImage, thirdImage, fourthImage, fifthImage, sixthImage, seventhImage, eigthImage, ninthImage, tenthImage];
    
    self.photoCollection = [[PhotoCollection alloc] initWithPhotos:self.photos];
    
    NSInteger numberofGroups = self.photoCollection.groupSections.count;
    NSLog(@"%ld", (long) numberofGroups);
    NSInteger numberofLocations = self.photoCollection.locationSections.count;
    NSLog(@"%ld", (long) numberofLocations);
    
    //self.groupStrings = self.photoCollection.groupSections[0];
    NSLog(@"%@", self.photoCollection.groupSections[0]);
    NSLog(@"%@", self.photoCollection.locationSections[0]);
    
//    self.photos = @[@"ski.JPG", @"ski2.JPG", @"crowd.JPG", @"people.JPG", @"people2.JPG", @"mac.JPG", @"mac2.JPG", @"screen.JPG", @"ski3.JPG", @"ski4.JPG"];
//


}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
  
    
    if (self.seg.selectedSegmentIndex == 1) {
        NSString *stringLocation = self.photoCollection.locationSections[section];
        return [self.photoCollection photosForLocation:stringLocation].count;
    } else {
        NSString *stringGroup = self.photoCollection.groupSections[section];
        return [self.photoCollection photosForGroup:stringGroup].count;
    }
    
    

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    

    if (self.seg.selectedSegmentIndex == 1) {
        NSString *sectionNameLocation = self.photoCollection.locationSections[section];
        NSArray *photoLocationInfoArray = [self.photoCollection photosForLocation:sectionNameLocation];
        PhotoInfo *pi2 = photoLocationInfoArray[row];
        cell.photoImage.image = pi2.imageName;
    } else {
        NSString *sectionNameGroup = self.photoCollection.groupSections[section];
        NSArray *photoGroupInfoArray = [self.photoCollection photosForGroup:sectionNameGroup];
        PhotoInfo *pi = photoGroupInfoArray[row];
       cell.photoImage.image = pi.imageName;
    }
    
    
    return cell;
}







- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    if (self.seg.selectedSegmentIndex == 1) {
        return self.photoCollection.locationSections.count;
    } else {
        return self.photoCollection.groupSections.count;
    }
    
}



-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *sectionTitle = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
    UILabel *headerLabel = (UILabel*)[sectionTitle viewWithTag:1];
    
    if (self.seg.selectedSegmentIndex == 1) {
        headerLabel.text = self.photoCollection.locationSections[indexPath.section];
    } else {
        headerLabel.text = self.photoCollection.groupSections[indexPath.section];
    }
    return sectionTitle;
}

- (IBAction)switchLayout:(id)sender {
    [self.photoCollectionView reloadData];
    
}


@end
