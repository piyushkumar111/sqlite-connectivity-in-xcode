//
//  ClosedCompanyDatabase.m
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import "ClosedCompanyDatabase.h"
#import "ClosedCompanyInfo.h"

@implementation ClosedCompanyDatabase

static ClosedCompanyDatabase *_database;

+ (ClosedCompanyDatabase*)database {
    if (_database == nil) {
        _database = [[ClosedCompanyDatabase alloc] init];
    }
    return _database;
}

- (id)init
    {
        if ((self = [super init]))
        {
            NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"mydatabase"
                                                             ofType:@"sqlite"];
            if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK)
            {
                NSLog(@"Failed to open database!");
            }
    }
    return self;
}

- (NSArray *)ClosedCompanyInfos
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    NSString *query = @"SELECT CompanyName, ID,City, State, Zip, Details, StartingDate, EndingDate FROM Test";
    // ORDER BY EndingDate DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 1);
            char *nameChars = (char *) sqlite3_column_text(statement, 0);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            char *zipChars = (char *) sqlite3_column_text(statement, 4);
            char *detailsChars = (char *) sqlite3_column_text(statement, 5);
            char *sdateChars = (char *) sqlite3_column_text(statement, 6);
            char *edateChars = (char *) sqlite3_column_text(statement, 7);
            NSLog(@ " -- %d -- %s -- %s %s %s -- %s %s -- %s --" , uniqueId, nameChars,cityChars,stateChars, zipChars, detailsChars , stateChars, edateChars);
            
            
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            NSString *zip = [[NSString alloc] initWithUTF8String:zipChars];
            NSString *details = [[NSString alloc] initWithUTF8String:detailsChars];
            NSString *sdate = [[NSString alloc] initWithUTF8String:sdateChars];
            NSString *edate = [[NSString alloc] initWithUTF8String:edateChars];

            
            ClosedCompanyInfo *info = [[ClosedCompanyInfo alloc]
                                    initWithcid:uniqueId name:name city:city state:state zip:zip startDate:sdate endDate:edate details:details];
            [retval addObject:info];
            [name release];
            [city release];
            [state release];
            [zip release];
            [details release];
            [sdate release];
            [edate release];
            [info release];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (void)dealloc {
    sqlite3_close(_database);
    [super dealloc];
}

@end
