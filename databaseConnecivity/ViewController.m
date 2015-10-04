//
//  ViewController.m
//  databaseConnecivity
//
//  Created by c35 on 21/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import "ViewController.h"
#import "ClosedCompanyInfo.h"
#import "ClosedCompanyDatabase.h"
#import "customCell.h"
#import "DetailsPageController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize closedCompanyInfos=_closedCompanyInfos;


- (void)viewDidLoad
{
    self.navigationItem.title=@"Closed company";
    [super viewDidLoad];
    self.closedCompanyInfos = [ClosedCompanyDatabase database].ClosedCompanyInfos;
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_closedCompanyInfos count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 50;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"Cell";
    customCell *cell = (customCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib;
        nib= [[NSBundle mainBundle] loadNibNamed:@"customCell" owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[customCell class]])
        cell = (customCell *)oneObject;
    }
   
    ClosedCompanyInfo *info = [_closedCompanyInfos objectAtIndex:indexPath.row];
    
    cell.lblcname.text = info.name;
    cell.lblccity.text = info.city;
    cell.lblcstate.text = info.state;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"Selected row element %@",[ItemID objectAtIndex:indexPath.row]);
    ClosedCompanyInfo *info = [_closedCompanyInfos objectAtIndex:indexPath.row];
    
    DetailsPageController *dp = [[DetailsPageController alloc] init];
    [self.navigationController pushViewController:dp animated:YES];
    
    dp.lblcid.text= [[NSString alloc] initWithFormat:@"%d",info.cid];
    dp.lblcname.text= info.name;
    dp.lblccity.text= info.city;
    dp.lblcstate.text= info.state;
    dp.lblczip.text= info.zip;
    dp.lblcsd.text= info.startDate;
    dp.lblced.text= info.endDate;
    dp.lblcdetails.text= info.deatils;

    
   // dp.lblItemId.text=[`ItemID objectAtIndex:indexPath.row];
  }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
