//
//  MainPageCollectionCell.m
//  Score
//
//  Created by Wang Long on 1/13/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "MainPageCollectionCell.h"

@implementation MainPageCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setNameString:(NSString *)nameString
{
    if(![_nameString isEqualToString:nameString])
    {
        _nameString = [nameString copy];
        _nameLabel.text = _nameString;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
