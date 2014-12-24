//
//  BFScanViewController.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFScanViewController.h"

#import "ZBarSDK.h"

@interface BFScanViewController () <ZBarReaderViewDelegate>

@property (strong, nonatomic) ZBarReaderView *readerView;

@end

@implementation BFScanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"xxx");
    
    self.readerView = [[ZBarReaderView alloc] init];
    self.readerView.frame = CGRectMake(60, CGRectGetMidY(self.view.frame) - 100, 200, 200);
    self.readerView.torchMode = 0;
    self.readerView.readerDelegate = self;
    
    [self.view addSubview:self.readerView];
    
    [self.readerView start];
}

- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    for(ZBarSymbol *symbol in symbols)
    {
        NSLog(@"%@", symbol.data);
    }
    
    [self.readerView stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
