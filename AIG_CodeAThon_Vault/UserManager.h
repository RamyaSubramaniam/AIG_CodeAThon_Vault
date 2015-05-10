//
//  UserManager.h
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015. Attrecto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LoginHandler)(BOOL loggedIn, NSError *error);

@interface UserManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) NSDictionary *user;

- (void)loginWithEmail:(NSString*)email password:(NSNumber*)password completion:(LoginHandler)handler;
- (void)logout;
- (BOOL)hasCachedLoginInformation;


@end
