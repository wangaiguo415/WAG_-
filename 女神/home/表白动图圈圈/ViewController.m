//
//  ViewController.m
//  ABC
//
//  Created by wangaiguo on 2017/4/20.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//


#import "ViewController.h"

@interface ViewController (){
    UILabel *label;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.backgroundColor = [UIColor greenColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:40];
    label.textColor = [UIColor redColor];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 50;
    [self.view addSubview:label];
    [self moving];
    [self counting];
    [self changeingBackColor];
    
    
    NSData *data = [@"abcdefg" dataUsingEncoding:NSUTF8StringEncoding];
    NSString *data_64 = [NSString stringWithFormat:@"%@",[data base64EncodedDataWithOptions:0]];
    NSLog(@"data_64:::%@", data_64);
}

-(void)moving{
    static int aaa = 1;
    static int bbb = 1;
    if(label.frame.origin.x + 100 ==  self.view.frame.size.width){
        aaa = -1;
    }else if(label.frame.origin.x == 0)
    {
        aaa=1;    }
    
    if(label.frame.origin.y + 100 == self.view.frame.size.height){
        bbb = -1;
    }else if(label.frame.origin.y == 0){
        bbb=1;
    }
    
    
    label.frame = CGRectMake(label.frame.origin.x +aaa , label.frame.origin.y + bbb, 100, 100);

    
    [self performSelector:@selector(moving) withObject:nil afterDelay:0.01];
}

- (void)counting{
    static NSInteger aaa = 1;
//    label.text = [NSString stringWithFormat:@"%ld",aaa];
    if (aaa % 3 == 0) {
        label.text = @"女神";
    }else if (aaa % 3 == 1){
        label.text = @"爱";
    }else{
        label.text = @"你";
    }
    aaa ++;
    if (aaa > 10000) {
        aaa = 1;
    }
    [self performSelector:@selector(counting) withObject:nil afterDelay:1];
}


- (void)changeingBackColor{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%100/100.0 blue:arc4random()%150/150.0 alpha:1];
    [self performSelector:@selector(changeingBackColor) withObject:nil afterDelay:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
