//
//  ProductsTableItemCell.m
//  Score
//
//  Created by Wang Long on 1/22/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "ProductsTableItemCell.h"

@implementation ProductsTableItemCell

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

- (IBAction)minusClicked:(id)sender
{
    NSLog(@"minus clicked");
}

- (IBAction)plusClicked:(id)sender
{
    NSLog(@"plus clicked");
}

@end
