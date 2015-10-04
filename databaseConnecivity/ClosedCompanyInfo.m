//
//  ClosedCompanyInfo.m
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import "ClosedCompanyInfo.h"

@implementation ClosedCompanyInfo

@synthesize cid = _cid;
@synthesize name = _name;
@synthesize city = _city;
@synthesize state = _state;
@synthesize zip = _zip;
@synthesize deatils = _deatils;
@synthesize startDate = _startDate;
@synthesize endDate = _endDate;

-(id)initWithcid:(int)cid1 name:(NSString *)name1 city:(NSString *)city1 state:(NSString *)state1 zip:(NSString *)zip1 startDate:(NSString *)startDate1 endDate:(NSString *)endDate1 details:(NSString *)details1
{
    if ((self = [super init]))
    {
        self.cid = cid1;
        self.name = name1;
        self.city = city1;
        self.state = state1;
        self.zip = zip1;
        self.startDate = startDate1;
        self.endDate = endDate1;
        self.deatils = details1;
    }
    return self;
}

- (void) dealloc {
    self.cid = 0;
    self.name = nil;
    self.city = nil;
    self.state = nil;
    self.zip = nil;
    self.startDate = nil;
    self.endDate = nil;
    self.deatils = nil;
    [super dealloc];
}


@end
