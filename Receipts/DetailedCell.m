//
//  DetailedCell.m
//  Receipts
//
//  Created by Yana Kultysheva on 2016-07-21.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "DetailedCell.h"

@implementation DetailedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if(selected) {
       self.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the view for the selected state
}

@end
