//
//  ViewController.m
//  九宫格
//
//  Created by 👫 on 16/4/8.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 50, 50)];
    addButton.backgroundColor = [UIColor blueColor];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(add ) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *removeButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 30, 50, 50)];
    removeButton.backgroundColor = [UIColor blueColor];
    [removeButton setTitle:@"删除" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(32, 95, 311, 313)];
    _mainView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview: addButton];
    [self.view addSubview: removeButton];
    [self.view addSubview: _mainView];
    
}

/** 向mainView里添加sunView */
-(void)add{
    
    //设置超出mainView的sunView不显示
    _mainView.clipsToBounds = YES;
    
    UIView *sunView = [[UIView alloc] init];
    sunView.backgroundColor = [UIColor greenColor];
    
    //每一个添加view的尺寸
    CGFloat viewW = 50;
    CGFloat viewH = 70;
    
    //列数
    int cols = 5;
    
    //列间距
    CGFloat colMargin = (_mainView.frame.size.width - cols * viewW) / (cols - 1);
    
    //行间距
    CGFloat rowMargin = 10;
    
    //view个数
    NSUInteger index = _mainView.subviews.count;
    
    //view的x值
    NSUInteger col = index % cols;
    CGFloat viewX = col * (viewW + colMargin);
    
    //view的y值
    NSInteger row = index / cols;
    CGFloat viewY = row * (viewH + rowMargin);
    
    sunView.frame = CGRectMake(viewX, viewY, viewW, viewH);
    
    [_mainView addSubview: sunView];
    
}

/** 从mainView里删除sunView */
-(void)remove{
    [[_mainView.subviews lastObject] removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end