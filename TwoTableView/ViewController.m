//
//  ViewController.m
//  TwoTableView
//
//  Created by fengbai on 16/7/22.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"

@interface ViewController ()

@property (nonatomic, strong) LeftViewController *leftVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _leftVC = [[LeftViewController alloc] init];
}

- (IBAction)click:(id)sender {
    [self.navigationController pushViewController:_leftVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
