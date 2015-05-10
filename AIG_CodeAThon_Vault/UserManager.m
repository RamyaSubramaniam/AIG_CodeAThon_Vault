//
//  UserManager.m
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015. Attrecto. All rights reserved.
//

#import "UserManager.h"
#import "AppStateManager.h"
#import "ViewControllerFactory.h"
#import "ParseManager.h"
#import "KeyChainManager.h"
#import "CompanionAppManager.h"

@implementation UserManager

static UserManager *_sharedInstance;

+ (instancetype)sharedManager
{
    if (_sharedInstance)
    {
        return _sharedInstance;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[UserManager alloc] init];
    });
    
    return _sharedInstance;
}

- (void)loginWithEmail:(NSString *)email password:(NSNumber *)password completion:(LoginHandler)handler
{
    
    
    if (self.user)
    {
        [[AppStateManager sharedManager] transitionToState:ApplicationStateLoggedIn animated:YES];
        //handler(YES, nil);
    }
    else
    {
        self.user = @{@"email": email};
//        [[ParseManager sharedInstance] customerOrNilWithEmailAddress:email andPassword: password withCallback:^(Customer *customer) {
//            
//            if (customer) {
//                [[KeyChainManager sharedManager] updateUserId:customer.customerID];
//                
//                [[KeyChainManager sharedManager] savePassword:[password intValue]];
//                
//                [[KeyChainManager sharedManager] saveUserName:email];
//                
//                if([[KeyChainManager sharedManager] getLogInRequestFromKeychain]){
//                    [[KeyChainManager sharedManager] removeLogInRequest];
//                    [[KeyChainManager sharedManager] saveShowLoggedInState];
//                    if([[CompanionAppManager sharedInstance] canOpenCompanionAppWithURLString:@"assessment://"]){
//                        [[CompanionAppManager sharedInstance] openCompanionAppWithURLString:@"assessment://"];
//                    }
//                    
//                }
//                
//                handler(YES, nil);
//                                
//            }
//        }];

    }
}

- (void)logout
{
     self.user = nil;
     [[AppStateManager sharedManager] transitionToState:ApplicationStateNotLoggedIn animated:YES];
    
   /* [ViewControllerFactory showIndeterminateLoadingView];
    
    [[WSManager sharedWSManager] logoutWithHandler:^(BOOL isSuccessful, DSJSONRPCError *methodError, NSError *error) {
        
        [ViewControllerFactory hideLoadingView];
        
        self.user = nil;
        
        [[AppStateManager sharedManager] transitionToState:ApplicationStateNotLoggedIn animated:YES];
        [[ViewControllerFactory sharedFactory] resetTabBarNavigationStacks:NO];
        
    }];*/
}

- (BOOL)hasCachedLoginInformation
{
    
    return [[KeyChainManager sharedManager] getUserNameFromKeychain];
    
    
    //  self.user != nil;
}



@end
