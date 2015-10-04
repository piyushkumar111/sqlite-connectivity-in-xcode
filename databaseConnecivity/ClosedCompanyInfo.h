//
//  ClosedCompanyInfo.h
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClosedCompanyInfo : NSObject
{
    int cid;
    NSString *name;
    NSString *city;
    NSString *state;
    NSString *zip;
    NSString *details;
    NSString *startDate;
    NSString *endDate;
}

@property (nonatomic, assign) int cid;;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, copy) NSString *deatils;
@property (nonatomic, copy) NSString *startDate;
@property (nonatomic, copy) NSString *endDate;

- (id)initWithcid:(int)cid1 name:(NSString *)name1 city:(NSString *)city1
            state:(NSString *)state1 zip:(NSString *)zip1 startDate:(NSString *)startDate1 endDate:(NSString *)endDate1 details:(NSString *)details1;

@end

