//
//  AEFlickrManager.m
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import "AEFlickrManager.h"
#import "AENetworkManager.h"

@interface AEFlickrManager ()
{
    AENetworkManager *_network;
    NSArray *_items;
}

@end

@implementation AEFlickrManager

+ (instancetype)sharedManager {
    
    static AEFlickrManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AEFlickrManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {

    self = [super init];
    if (self) {
        _network = [[AENetworkManager alloc] init];
    }
    return self;
}

- (NSInteger)itemsCount {
    return _items.count;
}

- (void)clean {
    
    _items = @[];
}

- (NSString *)itemByIndex:(NSInteger)index {
    
    if (index < 0 || index >= self.itemsCount){
        return nil;
    }
    
    return _items[index];
}

- (void)searchByTag:(NSString *)tag withCompletion:(void(^)(BOOL success))completion{
    
    [_network searchByTag:tag withCompletion:^(NSArray *result) {
        
        if (result == nil){
            completion(NO);
        }
        else{
            _items = [result copy];
            completion(YES);
        }
    }];
}

@end
