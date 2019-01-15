//
//  ViewController.m
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "NSObject+JsonModel.h"
#import "User.h"
#import "Picture.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *statuses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"statuss" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
//    NSLog(@"%@",dict);
    
    NSArray *dictArr = dict[@"statuses"];
    
    _statuses = [NSMutableArray array];
    // 遍历字典数组
    for (NSDictionary *dict in dictArr) {
        Status *status = [Status modelWithDict:dict];
        [_statuses addObject:status];
    }
    
//    NSLog(@"%@ %@",_statuses,[_statuses[0] user]);
    Status *status = _statuses[0];
    NSLog(@"id:%ld",status.ID);
    NSLog(@"sourceID:%@",status.sourceID);

//    NSLog(@"name:%@",status.user.name);
    Picture *p = status.pic_urls[0];
//    NSLog(@"thumbnail_pic:%@",p.thumbnail_pic);

    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
