//
//  BFProductsViewController.m
//  Score
//
//  Created by Wang Long on 1/21/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "BFProductsViewController.h"
#import "ProductsTableItemCell.h"

static NSInteger CategoryTableTag = 11;
static NSInteger ProductTableTag = 12;

static NSString *CategoryCellIdentifier = @"CategoryCell";
static NSString *ProductCellIdentifier = @"ProductItemIdentifier";

@interface BFProductsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
@property (weak, nonatomic) IBOutlet UITableView *productsTable;
@property NSInteger currentCategoryIndex;

@property (strong, nonatomic) NSArray *productsForCategory;

@end

@implementation BFProductsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.shopNameLabel.text = self.shopNameString;
}

- (void)initProductsInCategories
{
    self.productsForCategory = @[
                                 @{@"销量排行":
                                 @[@{@"name":@"红茶拿铁", @"price":@"33", @"unit":@"杯", @"attr":@"超大杯"},
                                  @{@"name":@"焦糖拿铁", @"price":@"33", @"unit":@"杯", @"attr":@"超大杯"},
                                  @{@"name":@"卡布奇诺", @"price":@"33", @"unit":@"杯", @"attr":@"大杯"},
                                  @{@"name":@"摩卡", @"price":@"33", @"unit":@"杯", @"attr":@"大杯"}]
                                   },
                                 @{@"饮品":
                                 @[@{@"name":@"中式茶", @"price":@"20", @"unit":@"杯", @"attr":@""},
                                  @{@"name":@"冰摇柠檬茶", @"price":@"22", @"unit":@"杯", @"attr": @"中"},
                                  @{@"name":@"冰摇红莓黑加仑", @"price":@"27", @"unit":@"杯", @"attr":@"大"},
                                  @{@"name":@"冰摇柠檬茶", @"price":@"28", @"unit":@"杯", @"attr":@"超大杯"}]
                                   },
                                 @{@"主食":
                                 @[@{@"name":@"火腿芝士可颂", @"price":@"20", @"unit":@"份", @"attr":@""},
                                  @{@"name":@"纽约芝士蛋糕", @"price":@"24", @"unit":@"份", @"attr":@""},
                                  @{@"name":@"法式浓情巧克力蛋糕", @"price":@"24", @"unit":@"份", @"attr":@""}]
                                   }
                                 ];
}

- (void)initProductTable
{
    self.productsTable.delegate = self;
    self.productsTable.dataSource = self;
    
    self.productsTable.rowHeight = 62;
    
    [self.productsTable registerClass:[ProductsTableItemCell class] forCellReuseIdentifier:ProductCellIdentifier];
    UINib *nib = [UINib nibWithNibName:@"ProductsTableItemCell" bundle:nil];
    [self.productsTable registerNib:nib forCellReuseIdentifier:ProductCellIdentifier];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.currentCategoryIndex = 0;
    
    self.categoryTable.delegate = self;
    self.categoryTable.dataSource = self;
    //self.productsTable.delegate = self;
    //self.productsTable.dataSource = self;
    [self initProductTable];
    
    [self initProductsInCategories];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == CategoryTableTag)
    {
        return [self.productsForCategory count];
    } else {
        NSDictionary *dict = (NSDictionary *)[self.productsForCategory objectAtIndex:self.currentCategoryIndex];
        return [[dict objectForKey:[[dict allKeys] objectAtIndex:0]] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *categoryKeyString;
    NSDictionary *dict;
    //NSArray *array;
    if(tableView.tag == CategoryTableTag)
    {
        UITableViewCell *cell;
        cell = [self.categoryTable dequeueReusableCellWithIdentifier:CategoryCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[[self.productsForCategory objectAtIndex:indexPath.row] allKeys] objectAtIndex:0];
        return cell;
    } else {
        ProductsTableItemCell *cell = (ProductsTableItemCell *)[self.productsTable dequeueReusableCellWithIdentifier:ProductCellIdentifier forIndexPath:indexPath];
        categoryKeyString = [[[self.productsForCategory objectAtIndex:self.currentCategoryIndex] allKeys] objectAtIndex:0];
        //NSArray *tmpArray = [self.productsForCategory objectAtIndex:self.currentCategoryIndex] objectForKey:<#(id)#>
        dict = (NSDictionary *)[[[self.productsForCategory objectAtIndex:self.currentCategoryIndex] objectForKey:categoryKeyString] objectAtIndex:indexPath.row];
    
        cell.nameLabel.text = [dict objectForKey:@"name"];
        cell.priceLabel.text = [dict objectForKey:@"price"];
        self.categoryLabel.text = categoryKeyString;
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == CategoryTableTag)
    {
        self.currentCategoryIndex = indexPath.row;
        [self.productsTable reloadData];
    }
    if(tableView.tag == ProductTableTag)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

- (IBAction)confirmShopping:(id)sender {
}

@end
