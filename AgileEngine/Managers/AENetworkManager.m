//
//  AENetworkManager.m
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import "AENetworkManager.h"
#import <AFNetworking.h>

static NSString * const apiKey = @"8513536db7983082a3b2b889fb275a3d";

@implementation AENetworkManager

- (void)searchByTag:(NSString *)tag withCompletion:(void (^)(NSArray *result))completion{

    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];

    NSString *stringUrl = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&format=json&nojsoncallback=1", apiKey, tag];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:stringUrl]];
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {

        NSArray *result = nil;
        if (error == nil){
            
            result = [self.class parseSearchResponse:responseObject];
        }

        if (completion){
            completion(result);
        }
        
    }] resume];
}

#pragma mark -

+ (NSArray *)parseSearchResponse:(NSDictionary *)response{
    
    NSMutableArray *result = [NSMutableArray array];

    NSDictionary *photos = response[@"photos"];
    NSArray *photoArray = photos[@"photo"];
    for (NSDictionary *photo in photoArray) {
        
        NSLog(@"%@", photo);
        
        NSString *farm = photo[@"farm"];
        NSString *server = photo[@"server"];
        NSString *photoId = photo[@"id"];
        NSString *secret = photo[@"secret"];

        NSString *photoUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", farm, server, photoId, secret];
        
        [result addObject:photoUrl];
    }
    
    return result;
}

@end
