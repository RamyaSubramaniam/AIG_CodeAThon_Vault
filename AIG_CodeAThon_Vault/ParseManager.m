//
//  ParseManager.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "ParseManager.h"
#import <Parse/Parse.h>

@implementation ParseManager
+ (instancetype) sharedInstance
{
    static ParseManager *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ParseManager new];
    });
    
    return sharedInstance;
}

- (void) customerOrNilWithEmailAddress:(NSString *)emailAddress andPassword:(NSNumber *)password withCallback:(CustomerCallback)callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Customer"];
    [query whereKey:@"EmailAddress" equalTo:emailAddress];
    [query whereKey:@"Password" equalTo:password];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"Query ended %lu rows returned.", (unsigned long)[objects count]);
        
        PFObject *object = [objects lastObject];
        
        if([objects count] == 1) {
          /*  customer = [Customer new];
            customer.customerID = [[object objectForKey:@"CustomerID"] integerValue];
            customer.customerFirstName = [object objectForKey:@"FirstName"];
            customer.customerLastName = [object objectForKey:@"LastName"];
            customer.customerEmail = [object objectForKey:@"EmailAddress"];
            customer.customerSince = [[object objectForKey:@"CustomerSince"] integerValue];
            customer.address = [object objectForKey:@"Address"];
            customer.phoneNumber = [object objectForKey:@"PhoneNumber"];
            customer.socialHandle = [object objectForKey:@"SocialHandle"];
            customer.tenure = [[object objectForKey:@"Tenure"] integerValue];
            customer.claimsDuration = [[object objectForKey:@"ClaimsDuration"] integerValue];
            customer.auditFlag = [[object objectForKey:@"AuditGlag"] boolValue];
            customer.referralCount = [[object objectForKey:@"ReferralCount"] integerValue];
            customer.xlntScore = [[object objectForKey:@"XlntScore"] integerValue];*/
        }
        
        callback();
    }];
}
@end
