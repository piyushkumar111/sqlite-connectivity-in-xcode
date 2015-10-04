//
//  customCell.m
//  sampleTableView
//
//  Created by c35 on 19/09/13.
//  Copyright (c) 2013 c35. All rights reserved.
//

#import "customCell.h"

@implementation customCell

@synthesize lblccity,lblcname,lblcstate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
