//
//  KeyChainManager.m
//  AIG-CodeAThon-Ireland
//
//  Created by Adam Bella on 2015. 03. 04..
//  Copyright (c) 2015. Bella. All rights reserved.
//

#import "KeyChainManager.h"
#import "Keychain.h"

@implementation KeyChainManager
static KeyChainManager *_sharedInstance;

+ (instancetype)sharedManager
{
    if (_sharedInstance)
    {
        return _sharedInstance;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KeyChainManager alloc] init];
    });
    
    return _sharedInstance;
}

-(Keychain*)getKeychain{
     return [[Keychain alloc] initWithService:@"SAVE_PASSWORD" withGroup:nil];
}

-(void)savePassword:(NSInteger)password  {
    Keychain *keychain= [self getKeychain];
   
    NSString *key =@"CodeAThon.Irland.Password";
    NSData * value = [[NSString stringWithFormat:@"%ld",(long)password ] dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain insert:key :value])
    {
        NSLog(@"Successfully added data");
    }
    else
        NSLog(@"Failed to  add data");
    
}


-(NSInteger)getUserPasswordFromKeychain{
    Keychain *keychain= [self getKeychain];
    
    NSString *key= @"CodeAThon.Irland.Password";
    NSData * data =[keychain find:key];
    if(data == nil)
    {
        NSLog(@"Keychain data not found");
        return -1;
    }
    else
    {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].integerValue;
       
        NSLog(@"Data is =%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }

}

-(void)saveUserId:(NSInteger)userId {
    Keychain *keychain= [self getKeychain];
    
    NSString *key =@"CodeAThon.Irland.UserId";
    NSData * value = [[NSString stringWithFormat:@"%ld",(long)userId ] dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain insert:key :value])
    {
        NSLog(@"Successfully added data");
    }
    else
        NSLog(@"Failed to  add data");
}

-(void)saveLogInRequest {
    Keychain *keychain= [self getKeychain];
    
    NSString *key =@"CodeAThon.Irland.logIgRequestFromVault";
    NSData * value = [[NSString stringWithFormat:@"%d",1] dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain insert:key :value])
    {
        NSLog(@"Successfully added data");
    }
    else
        NSLog(@"Failed to  add data");
}

-(NSInteger)getUserIdFromKeychain{
    Keychain *keychain= [self getKeychain];
    
    NSString *key= @"CodeAThon.Irland.UserId";
    NSData * data =[keychain find:key];
    if(data == nil)
    {
        NSLog(@"Keychain data not found");
        return -1;
    }
    else
    {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].integerValue;
        
    }
    
}

-(void)saveUserName:(NSString*)userName  {
    Keychain *keychain= [self getKeychain];
    
    NSString *key =@"CodeAThon.Irland.UserName";
    NSData * value = [userName dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain insert:key :value])
    {
        NSLog(@"Successfully added data");
    }
    else
        NSLog(@"Failed to  add data");
    
}


-(NSString*)getUserNameFromKeychain{
    Keychain *keychain= [self getKeychain];
    
    NSString *key= @"CodeAThon.Irland.UserName";
    NSData * data =[keychain find:key];
    if(data == nil)
    {
        NSLog(@"Keychain data not found");
        return nil;
    }
    else
    {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"Data is =%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
    
}

-(void)updateUserName:(NSString*)userName{
    
    Keychain *keychain= [self getKeychain];
    
    NSString *key = @"CodeAThon.Irland.UserName";
    NSData * value = [userName dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain update:key :value])
    {
        NSLog(@"Successfully updated data");
    }
    else
        NSLog(@"Failed to  add data");
}


-(void)updatePassword:(NSInteger)password{
    
     Keychain *keychain= [self getKeychain];
    
    NSString *key = @"CodeAThon.Irland.Password";
    NSData * value = [[NSString stringWithFormat:@"%ld",(long)password ] dataUsingEncoding:NSUTF8StringEncoding];
    
    if([keychain update:key :value])
    {
        NSLog(@"Successfully updated data");
    }
    else
        NSLog(@"Failed to  add data");
}

-(void)removePasswordAndUserName{
    
    Keychain *keychain= [self getKeychain];
    
    NSString *key = @"CodeAThon.Irland.Password";
    NSString *key2= @"CodeAThon.Irland.UserName";

    if([keychain remove:key])
    {
        NSLog(@"Successfully removed data");
    }
    else
    {
        NSLog(@"Unable to remove data");
    }

    if([keychain remove:key2])
    {
    NSLog(@"Successfully removed data");
    }
    else
    {
    NSLog(@"Unable to remove data");
    }}

-(void)removeLoggedInState{
    
    Keychain *keychain= [self getKeychain];
    
    NSString *key = @"CodeAThon.Irland.LoggedInState";

    
    if([keychain remove:key])
    {
        NSLog(@"Successfully removed data");
    }
}

-(NSInteger)getLoggedInState{
    Keychain *keychain= [self getKeychain];
    
    NSString *key= @"CodeAThon.Irland.LoggedInState";
    NSData * data =[keychain find:key];
    if(data == nil)
    {
        NSLog(@"Keychain data not found");
        return -1;
    }
    else
    {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].integerValue;
        
    }
    
}
@end
