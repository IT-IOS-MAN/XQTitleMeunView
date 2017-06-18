//
//  ViewController.m
//  XQTitleMeunView
//
//  Created by mac-2016 on 17/6/17.
//  Copyright © 2017年 mac-2016. All rights reserved.
//

#import "ViewController.h"
#import "XQTitleMeunView.h"
#import "Masonry.h"

#define WeakSelf __weak typeof(self) weakSelf = self;

@interface ViewController ()<XQTitleMeunViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeakSelf
    
    XQTitleMeunView *meunView = [[XQTitleMeunView alloc] init];
    meunView.navHeight = 50;
    meunView.delegate = self;
    [self.view addSubview:meunView];
    
    [meunView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(meunView.navHeight);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(MUEUN_HEIGHT);
    }];
}

#pragma mark - XQTitleMeunViewDelegate

- (NSInteger)numberOfSectionsInTitleMeunView:(XQTitleMeunView *) titleMeunView
{
    return 3;
}

- (NSInteger)titleMeunView:(XQTitleMeunView *) titleMeunView numberOfRowsInSection:(NSInteger)section
{
    return section * 5 + 1;
}

- (NSString *)titleMeunView:(XQTitleMeunView *) titleMeunView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [NSString stringWithFormat:@"菜单%@_%@", @(indexPath.section), @(indexPath.row)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
