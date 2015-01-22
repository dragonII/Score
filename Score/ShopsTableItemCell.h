//
//  ProductTableItemCell.h
//  Score
//
//  Created by Wang Long on 1/14/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopsTableItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalSoldAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingCollection;

@property (copy, nonatomic) NSString *imagePath;
@property (copy, nonatomic) NSString *nameString;
@property (copy, nonatomic) NSString *desciptionString;
@property (copy, nonatomic) NSString *totalSoldAmountString;
@property (copy, nonatomic) NSString *ratingString;

@end
