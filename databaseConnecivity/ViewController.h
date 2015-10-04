//
//  ViewController.h
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_closedCompanyInfos;
    //UITableView *tbl;
}
@property (nonatomic, retain) IBOutlet UITableView *tbl;
@property (nonatomic, retain) NSArray *closedCompanyInfos;


@end
