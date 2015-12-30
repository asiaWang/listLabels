//
//  ViewController.m
//  LabelView
//
//  Created by bo on 15/12/28.
//  Copyright © 2015年 com.pencho.com. All rights reserved.
//

#import "ViewController.h"
#import "ListLabelsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ListLabelsView *listView = [[ListLabelsView alloc]init];
    listView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    listView.backgroundColor = [UIColor greenColor];
    [listView setLabels:@[@[@"12",@"233",@"4566",@"3245566",@"67547567567",@"3245566",@"67547567567",@"12",@"233",@"4566",@"3245566",@"67547567567"],@[@"123",@"是个",@"撒地方"]] textColors:@[]];
    [self.view addSubview:listView];
    listView.frame = CGRectMake(listView.frame.origin.x, listView.frame.origin.y, listView.frame.size.width, listView.listViewSize.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
