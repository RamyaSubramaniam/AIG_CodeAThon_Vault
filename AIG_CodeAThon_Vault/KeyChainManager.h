//
//  KeyChainManager.h
//  AIG-CodeAThon-Ireland
//
//  Created by Adam Bella on 2015. 03. 04..
//  Copyright (c) 2015. Bella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainManager : NSObject
+ (instancetype)sharedManager;

-(void)savePassword:(NSInteger)password ;
-(void)removePasswordAndUserName;
-(void)updatePassword:(NSInteger)password;
-(NSInteger)getUserPasswordFromKeychain;

-(void)updateUserName:(NSString*)userName;
-(NSString*)getUserNameFromKeychain;
-(void)saveUserName:(NSString*)userName;

-(void)saveUserId:(NSInteger)userId;
-(NSInteger)getUserIdFromKeychain;
-(void)saveLogInRequest;
-(void)saveHomeRequest;

-(NSInteger)getLoggedInState;
-(void)removeLoggedInState;
@end
