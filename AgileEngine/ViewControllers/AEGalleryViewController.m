//
//  AEGalleryViewController.m
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import "AEGalleryViewController.h"
#import "AEDetailsViewController.h"
#import "AEFlickrManager.h"
#import <UIImageView+AFNetworking.h>

static NSString * const keySegueShowDetails = @"SegueShowDetails";

@interface AEGalleryViewController ()

@end

@implementation AEGalleryViewController

static NSString * const reuseIdentifier = @"GalleryCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:keySegueShowDetails]) {
        
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
        AEDetailsViewController *vc = segue.destinationViewController;
        vc.photoIndex = indexPath.row;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [AEFlickrManager sharedManager].itemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *imageView = [cell viewWithTag:1];
    
    NSString *imageUrl = [[AEFlickrManager sharedManager] itemByIndex:indexPath.row];
    if (imageUrl){
        [imageView setImageWithURL:[NSURL URLWithString:imageUrl]];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return YES;
}

#pragma mark -

- (void)setup {
    
    [[AEFlickrManager sharedManager] clean];
    
    [[AEFlickrManager sharedManager] searchByTag:self.searchTag withCompletion:^(BOOL success) {
        
        [self.collectionView reloadData];
    }];
}


@end
