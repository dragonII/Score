//
//  ProductTableItemCell.m
//  Score
//
//  Created by Wang Long on 1/14/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "ShopsTableItemCell.h"

static NSString *RatingStarName = @"ratingStar";
static NSString *HalfRatingStarName = @"halfRatingStar";
static NSString *NoRatingStarName = @"noRating";

@implementation ShopsTableItemCell

- (void)initDefaultRatingStars
{
    UIImageView *ratingItemView;
    for(int i = 0; i < 5; i++)
    {
        NSLog(@"initializing rating starts");
        ratingItemView = (UIImageView *)[_ratingCollection objectAtIndex:i];
        ratingItemView.image = [UIImage imageNamed:NoRatingStarName];
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    //[self initDefaultRatingStars];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNameString:(NSString *)nameString
{
    if(![_nameString isEqualToString:nameString])
    {
        _nameString = [nameString copy];
        _nameLabel.text = _nameString;
    }
}

- (void)setDesciptionString:(NSString *)desciptionString
{
    if(![_desciptionString isEqualToString:desciptionString])
    {
        _desciptionString = [desciptionString copy];
        _descLabel.text = _desciptionString;
    }
}

- (void)setTotalSoldAmountString:(NSString *)totalSoldAmountString
{
    if(![_totalSoldAmountString isEqualToString:totalSoldAmountString])
    {
        _totalSoldAmountString = [totalSoldAmountString copy];
        //_totalSoldAmountLabel.text = _totalSoldAmountString;
        _totalSoldAmountLabel.text = [NSString stringWithFormat:@"月售: %@", _totalSoldAmountString];
    }
}

- (void)setImagePath:(NSString *)imagePath
{
    if(![_imagePath isEqualToString:imagePath])
    {
        if([imagePath length] == 0)
            _imagePath = nil;
        else
        {
            _imagePath = [imagePath copy];
            _productImgView.image = [UIImage imageNamed:_imagePath];
        }
    }
}

- (void)setRatingString:(NSString *)ratingString
{
    CGFloat ratingValue = 0.0f;
    int finalRating = 0;
    BOOL isFloat = NO;
    UIImageView *ratingItemImage;
    int i = 0;
    
    if(![_ratingString isEqualToString:ratingString])
    {
        _ratingString = [ratingString copy];
        
        ratingValue = [_ratingString floatValue];
        
        finalRating = (int)ratingValue;
        
        if((CGFloat)finalRating == ratingValue)
            isFloat = NO;
        else
            isFloat = YES;
        
        if(finalRating >= 5)
        {
            isFloat = NO;
            finalRating = 5;
        }

        for(i = 0; i < finalRating; i++)
        {
            ratingItemImage = (UIImageView *)[_ratingCollection objectAtIndex:i];
            ratingItemImage.image = [UIImage imageNamed:RatingStarName];
            //ratingItemImage.image = [UIImage imageNamed:NoRatingStarName];
        }
        if(isFloat)
        {
            ratingItemImage = (UIImageView *)[_ratingCollection objectAtIndex:i];
            ratingItemImage.image = [UIImage imageNamed:HalfRatingStarName];
            i++;
        }
        
        for(; i < 5; i++)
        {
            ratingItemImage = (UIImageView *)[_ratingCollection objectAtIndex:i];
            ratingItemImage.image = [UIImage imageNamed:NoRatingStarName];
        }
    }
}

@end
