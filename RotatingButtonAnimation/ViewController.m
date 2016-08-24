//
//  ViewController.m
//  RotatingButtonAnimation
//
//  Created by David on 16/8/24.
//  Copyright © 2016年 David. All rights reserved.
//

#import "ViewController.h"
#import "RotatingButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RotatingButton *btn = [[RotatingButton alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor grayColor];
    [btn setNormalImage:[UIImage imageNamed:@"cancel.png"] selectedImage:[UIImage imageNamed:@"normal.png"]]; 
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(clickTest) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickTest {
    NSLog(@"UIControlEventTouchDragInside");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
