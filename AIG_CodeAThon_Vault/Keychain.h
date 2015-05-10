//
//  Keychain.h
//  AIG-CodeAThon-Ireland
//
//  Created by Adam Bella on 2015. 03. 04..
//  Copyright (c) 2015. Bella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Keychain : NSObject
{
    NSString * service;
    NSString * group;
}
-(id) initWithService:(NSString *) service_ withGroup:(NSString*)group_;

-(BOOL) insert:(NSString *)key : (NSData *)data;
-(BOOL) update:(NSString*)key :(NSData*) data;
-(BOOL) remove: (NSString*)key;
-(NSData*) find:(NSString*)key;
@end
