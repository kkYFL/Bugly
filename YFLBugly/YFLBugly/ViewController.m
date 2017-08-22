//
//  ViewController.m
//  YFLBugly
//
//  Created by 杨丰林 on 2017/8/22.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)bugTest1:(UIButton *)sender {
    NSLog(@"it will throw an NSException ");
    NSArray * array = @[];
    NSLog(@"the element is %@", array[1]);
}

- (IBAction)buglyTest2:(UIButton *)sender {
    
    TestViewController *testView = [[TestViewController alloc]init];
    [self.navigationController pushViewController:testView animated:YES];

}


- (IBAction)bugly3:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
