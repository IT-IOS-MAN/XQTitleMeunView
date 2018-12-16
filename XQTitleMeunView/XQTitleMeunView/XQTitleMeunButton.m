//
//  XQTitleMeunButton.m
//  EasyFamily
//
//  Created by mac-2016 on 17/5/15.
//  Copyright © 2017年 IT_XQ. All rights reserved.
//

#import "XQTitleMeunButton.h"
#import "NSString+XYString.h"

@implementation XQTitleMeunButton

-(instancetype)init
{
    if (self = [super init]) {
        [self setupView];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    
    return self;
}

-(void)setupView
{
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setImage:[UIImage imageNamed:@"housekeeper_d"] forState:UIControlStateNormal];
    
    
    self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    self.titleLabel.numberOfLines = 1;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super titleRectForContentRect:contentRect];
    
    rect.origin.x -= 15;
    
    return rect;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super imageRectForContentRect:contentRect];
    
    rect.origin.x = MIN([self.titleLabel.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) font:self.titleLabel.font].width / 2 + contentRect.size.width / 2 + self.imageEdgeInsets.left, contentRect.size.width - 15);
    return rect;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }else{
        self.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
