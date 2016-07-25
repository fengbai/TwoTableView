//
//  LeftViewController.m
//  TwoTableView
//
//  Created by fengbai on 16/7/22.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import "LeftViewController.h"
#import "RightViewController.h"

@interface LeftViewController()<UITableViewDelegate, UITableViewDataSource, RightViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) RightViewController *rightVC;


@end

@implementation LeftViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initUI];
    [self configData];
    [self addRightVC];
}

- (void)initUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

- (void)addRightVC{
    _rightVC = [[RightViewController alloc] init];
    _rightVC.delegate = self;
    [self addChildViewController:_rightVC];
    [self.view addSubview:_rightVC.view];
}

- (void)configData {
    if (!_dataArray) {
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类", numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _dataArray = tmpArr;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13.f];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_rightVC) {
        [_rightVC scrollToSelectedIndexPath:indexPath];
    }
}

- (void)willDisplayHeaderView:(NSInteger)section{
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didEndDisplayHeaderView:(NSInteger)section{

    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section+1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}


@end
