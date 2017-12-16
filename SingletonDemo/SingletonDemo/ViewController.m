//
//  ViewController.m
//  SingletonDemo
//
//  Created by TNKHANH on 12/12/17.
//  Copyright © 2017 TNKHANH. All rights reserved.
//

#import "ViewController.h"
#import "ContentManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int value = [[ContentManager shareManager]getValue];
    NSLog(@"%d", value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
