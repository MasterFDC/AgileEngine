//
//  AENetworkManager.h
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AENetworkManager : NSObject

- (void)searchByTag:(NSString *)tag withCompletion:(void (^)(NSArray *result))completion;

@end
