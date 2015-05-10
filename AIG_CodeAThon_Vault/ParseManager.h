//
//  ParseManager.h
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CustomerCallback) ();

@interface ParseManager : NSObject
+ (instancetype) sharedInstance;
- (void) customerOrNilWithEmailAddress:(NSString *)emailAddress andPassword:(NSNumber *)password withCallback:(CustomerCallback)callback;
@end
