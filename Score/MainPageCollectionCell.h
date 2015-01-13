//
//  MainPageCollectionCell.h
//  Score
//
//  Created by Wang Long on 1/13/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (copy, nonatomic) NSString *nameString;

@end
