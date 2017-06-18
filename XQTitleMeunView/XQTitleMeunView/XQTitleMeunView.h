//
//  XQTitleMeunView.h
//  EasyFamily
//
//  Created by mac-2016 on 17/5/15.
//  Copyright © 2017年 GXQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XQTitleMeunView;

UIKIT_EXTERN NSInteger const MUEUN_HEIGHT;

@protocol XQTitleMeunViewDelegate <NSObject>

- (NSInteger)numberOfSectionsInTitleMeunView:(XQTitleMeunView *) titleMeunView;

- (NSInteger)titleMeunView:(XQTitleMeunView *) titleMeunView numberOfRowsInSection:(NSInteger)section;

- (NSString *)titleMeunView:(XQTitleMeunView *) titleMeunView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (void)titleMeunView:(XQTitleMeunView *) titleMeunView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)titleMeunView:(XQTitleMeunView *) titleMeunView currentSelectRowsInSection:(NSInteger)section;


// 如果没有实现此方法，tilte会显示当前选中的文字作为标题
- (NSString *)titleMeunView:(XQTitleMeunView *) titleMeunView titleAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XQTitleMeunView : UIView

@property(nonatomic, assign) id<XQTitleMeunViewDelegate> delegate;

@property(nonatomic, assign) CGFloat navHeight;

-(void)reloadData;

-(void)cleanTypeList;

@end
