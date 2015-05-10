//
//  CompanionAppManager.m
//  AIG-CodeAThon-Ireland
//
//  Created by Jakab Balázs on 04/03/15.
//  Copyright (c) 2015 Bella. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CompanionAppManager.h"

@interface CompanionAppManager ()
@property (nonatomic, strong) NSArray *companionAppURLSchemes;
@end

@implementation CompanionAppManager

+ (instancetype) sharedInstance
{
    static CompanionAppManager *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CompanionAppManager new];
    });

    return sharedInstance;
}

- (NSArray *) companionAppURLSchemes
{
    return @[@"assessment://", @"aigxlntdriver://", @"aigvault://", @"aigbehealthy://", @"aighomeowner://", @"aigtravel://"];
}

- (void) openCompanionAppWithURLString:(NSString *)urlString
{
    NSURL *appURL = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL: appURL];
}

- (BOOL) canOpenCompanionAppWithURLString:(NSString *)urlString
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]];
}

- (NSArray *) availableCompanionApps
{
    NSMutableArray *availableURLSchemes = [NSMutableArray new];
    for(NSString *s in self.companionAppURLSchemes) {
        if([self canOpenCompanionAppWithURLString:s]) {
            [availableURLSchemes addObject:s];
            NSLog(@"URL Scheme available: %@", s);
        }
    }
    
    return availableURLSchemes;
}

@end
