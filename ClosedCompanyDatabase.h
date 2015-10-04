//
//  ClosedCompanyDatabase.h
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ClosedCompanyDatabase : NSObject
{
    
    sqlite3 *_database;
}

+ (ClosedCompanyDatabase*)database;
- (NSArray *)ClosedCompanyInfos;

@end