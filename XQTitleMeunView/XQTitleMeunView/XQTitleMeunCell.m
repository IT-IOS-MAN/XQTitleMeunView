//
//  XQTitleMeunCell.m
//  EasyFamily
//
//  Created by mac-2016 on 17/5/20.
//  Copyright © 2017年 GXQ. All rights reserved.
//

#import "XQTitleMeunCell.h"
#import "Masonry.h"

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
    WeakSelf
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf.contentView);
        make.bottom.equalTo(weakSelf.contentView);
        make.height.mas_equalTo(0.5);
    }];
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
