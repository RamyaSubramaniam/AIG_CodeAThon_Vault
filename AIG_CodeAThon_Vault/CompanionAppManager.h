//
//  CompanionAppManager.h
//  AIG-CodeAThon-Ireland
//
//  Created by Jakab Balázs on 04/03/15.
//  Copyright (c) 2015 Bella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanionAppManager : NSObject

+ (instancetype) sharedInstance;
- (void) openCompanionAppWithURLString: (NSString *) urlString;
- (BOOL) canOpenCompanionAppWithURLString: (NSString *) urlString;
- (NSArray *) availableCompanionApps;

@end
