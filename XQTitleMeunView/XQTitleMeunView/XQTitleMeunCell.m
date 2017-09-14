//
//  XQTitleMeunCell.m
//  EasyFamily
//
//  Created by mac-2016 on 17/5/20.
//  Copyright © 2017年 GXQ. All rights reserved.
//

#import "XQTitleMeunCell.h"

#define WeakSelf __weak typeof(self) weakSelf = self;

@implementation XQTitleMeunCell

+(instancetype)titleMeunCellWithTableView:(UITableView *) tableView
{
    static NSString * CELLID = @"XQTitleMeunCellID";
    
    XQTitleMeunCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    
    if (!cell) {
        cell = [[XQTitleMeunCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView = selectedBackgroundView;
        self.textLabel.textColor = [UIColor lightGrayColor];
        
        [self setupView];
    }
    
    return self;
}

-(void)setupView
{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:lineView];
    
    [self.contentView addConstraints:@[[NSLayoutConstraint constraintWithItem:lineView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1
                                                              constant:0.5],
                                
                                [NSLayoutConstraint constraintWithItem:lineView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.contentView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:-0.5],
                                
                                [NSLayoutConstraint constraintWithItem:lineView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.contentView
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:lineView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.contentView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0]
                                ]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
