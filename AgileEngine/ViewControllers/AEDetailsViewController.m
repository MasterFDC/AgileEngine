//
//  AEDetailsViewController.m
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import "AEDetailsViewController.h"
#import "AEFlickrManager.h"
#import <UIImageView+AFNetworking.h>

@interface AEDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AEDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSString *photoUrl = [[AEFlickrManager sharedManager] itemByIndex:self.photoIndex];
    [self.imageView setImageWithURL:[NSURL URLWithString:photoUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
