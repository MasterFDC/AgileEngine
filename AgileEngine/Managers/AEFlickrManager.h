//
//  AEFlickrManager.h
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AEFlickrManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, readonly) NSInteger itemsCount;

- (void)clean;
- (NSString *)itemByIndex:(NSInteger)index;
- (void)searchByTag:(NSString *)tag withCompletion:(void(^)(BOOL success))completion;

@end
