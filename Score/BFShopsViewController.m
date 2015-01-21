//
//  BFShopsViewController.m
//  Score
//
//  Created by Wang Long on 1/14/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "BFShopsViewController.h"
#import "ProductTableItemCell.h"

static NSString *ProductItemIdentifer = @"ProductItemIdentifier";

@interface BFShopsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *productListArray;

@end

@implementation BFShopsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initProductsTable
{
    self.productsTable.delegate = self;
    self.productsTable.dataSource = self;
    
    self.productsTable.rowHeight = 68;
    
    [self.productsTable registerClass:[ProductTableItemCell class] forCellReuseIdentifier:ProductItemIdentifer];
    UINib *nib = [UINib nibWithNibName:@"ProductTableItemCell" bundle:nil];
    [self.productsTable registerNib:nib forCellReuseIdentifier:ProductItemIdentifer];
}

- (void)initProductList
{
    /*
    self.shopList = @[@{@"name":@"shop1", @"description":@"shop one"},
                      @{@"name":@"shop2", @"description":@"shop two"},
                      @{@"name":@"shop3", @"description":@"shop three"},
                      @{@"name":@"shop4", @"description":@"shop four"},
                      @{@"name":@"shop5", @"description":@"shop five"},
                      @{@"name":@"shop6", @"description":@"shop six"},
                      @{@"name":@"shop7", @"description":@"shop seven"},
                      @{@"name":@"shop8", @"description":@"shop eight"},
                      @{@"name":@"shop9", @"description":@"shop nine"}
                      ];
     */
    self.productListArray = @[
  @{@"name":@"周黑鸭", @"description":@"", @"totalSold":@"58", @"image":@"", @"rating":@"0"},
  @{@"name":@"仙芋世家", @"description":@"25元起送/6元配送费", @"totalSold":@"21", @"image":@"", @"totalSold":@"45", @"rating": @"1"},
  @{@"name":@"汉堡王", @"description":@"25元起送/6元配送费/47分钟送达", @"totalSold": @"18", @"image":@"", @"rating":@"4"},
  @{@"name":@"汉拿山", @"description":@"25元起送/6元配送费/42分钟送达", @"totalSold": @"39", @"image":@"", @"rating":@"4.5"}
                              ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self initProductsTable];
    
    [self initProductList];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductTableItemCell *cell = (ProductTableItemCell *)[tableView dequeueReusableCellWithIdentifier:ProductItemIdentifer forIndexPath:indexPath];
    
    cell.nameString = [[self.productListArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.imagePath = [[self.productListArray objectAtIndex:indexPath.row] objectForKey:@"image"];
    cell.desciptionString = [[self.productListArray objectAtIndex:indexPath.row] objectForKey:@"description"];
    cell.totalSoldAmountString = [[self.productListArray objectAtIndex:indexPath.row] objectForKey:@"totalSold"];
    cell.ratingString = [[self.productListArray objectAtIndex:indexPath.row] objectForKey:@"rating"];
    
    return cell;
}

@end
