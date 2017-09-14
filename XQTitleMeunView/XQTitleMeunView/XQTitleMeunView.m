//
//  XQTitleMeunView.m
//  EasyFamily
//
//  Created by mac-2016 on 17/5/15.
//  Copyright © 2017年 GXQ. All rights reserved.
//

#import "XQTitleMeunView.h"
#import "XQTitleMeunButton.h"
#import "XQTitleMeunCell.h"

static NSInteger const ROW_HEIGHT = 40;

NSInteger const MUEUN_HEIGHT = 46;

@interface XQTitleMeunView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property(nonatomic, weak) XQTitleMeunButton *selectBtn;

@property(nonatomic, weak) UITableView *tableView;

@property(nonatomic, assign) NSInteger currentSubIndex;

@property(nonatomic, weak) UIView *typeView;

@property(nonatomic, weak) UIView *tableViewBackgroundView;

@property(nonatomic, strong) NSLayoutConstraint *tableViewBottonConstraint;

@property(nonatomic, strong) NSLayoutConstraint *selfHeightConstraint;

@end

@implementation XQTitleMeunView

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
    [self setupTypeView];
    
    [self setupLineView];
    
    [self reloadData];
    
    [self setupTableView];
}


-(void)reloadData
{
    NSInteger number = [self.delegate numberOfSectionsInTitleMeunView:self];
    
    while (self.typeView.subviews.count < number) {
        
        XQTitleMeunButton *btn = [[XQTitleMeunButton alloc] init];
        
        [btn addTarget:self action:@selector(titleMeunButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [self.typeView addSubview:btn];
    }
    
    int i = 0;
    
    for (XQTitleMeunButton *btn in self.typeView.subviews) {
        
        if (i >= self.typeView.subviews.count) {
            btn.hidden = YES;
            return;
        }else{
            btn.hidden = NO;
        }
        if([self.delegate respondsToSelector:@selector(titleMeunView:titleAtIndexPath:)]){
            NSString *title = [self.delegate titleMeunView:self titleAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            [btn setTitle:title forState:UIControlStateNormal];
        }else if ([self.delegate respondsToSelector:@selector(titleMeunView:cellForRowAtIndexPath:)]) {
            NSString *title = [self.delegate titleMeunView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            [btn setTitle:title forState:UIControlStateNormal];
        }
        
        [self.typeView addConstraints:@[[NSLayoutConstraint constraintWithItem:btn
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.typeView
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1
                                                                         constant:0],
                                           
                                           [NSLayoutConstraint constraintWithItem:btn
                                                                        attribute:NSLayoutAttributeTop
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.typeView
                                                                        attribute:NSLayoutAttributeTop
                                                                       multiplier:1
                                                                         constant:0],
                                        (i ? [NSLayoutConstraint constraintWithItem:btn
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.typeView.subviews[i - 1]
                                                                          attribute:NSLayoutAttributeRight
                                                                         multiplier:1
                                                                           constant:0]
                                         :
                                           [NSLayoutConstraint constraintWithItem:btn
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.typeView
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1
                                                                         constant:0]),
                                           
                                           [NSLayoutConstraint constraintWithItem:btn
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.typeView
                                                                        attribute:NSLayoutAttributeWidth
                                                                       multiplier:1.0/number
                                                                         constant:0]
                                           ]];
        
        i++;
    }
    
}

-(void)setupLineView
{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:lineView];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:lineView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1
                                                                     constant:0.5],
                                       
                                       [NSLayoutConstraint constraintWithItem:lineView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.typeView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-0.5],
                                       
                                       [NSLayoutConstraint constraintWithItem:lineView
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       
                                       [NSLayoutConstraint constraintWithItem:lineView
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1
                                                                     constant:0]
                                       ]];
}

-(void)setupTypeView
{
    
    UIView *typeView = [[UIView alloc] init];
    typeView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:typeView];
    self.typeView = typeView;
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:typeView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeHeight
                                                       multiplier:1
                                                         constant:MUEUN_HEIGHT],
                           
                           [NSLayoutConstraint constraintWithItem:typeView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:0],
                           
                           [NSLayoutConstraint constraintWithItem:typeView
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1
                                                         constant:0],
                           
                           [NSLayoutConstraint constraintWithItem:typeView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1
                                                         constant:0]
                           ]];
}

-(void)setupTableView
{
    
    CGFloat topH = MUEUN_HEIGHT;
    
    UIButton *tableViewBackgroundView = [[UIButton alloc] init];
    tableViewBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    tableViewBackgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [tableViewBackgroundView addTarget:self action:@selector(tableViewBackgroundViewDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tableViewBackgroundView];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:tableViewBackgroundView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:topH],
                           
                           [NSLayoutConstraint constraintWithItem:tableViewBackgroundView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:0],
                           
                           [NSLayoutConstraint constraintWithItem:tableViewBackgroundView
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1
                                                         constant:0],
                           
                           [NSLayoutConstraint constraintWithItem:tableViewBackgroundView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1
                                                         constant:0]
                           ]];
    self.tableViewBackgroundView= tableViewBackgroundView;
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = ROW_HEIGHT;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableViewBackgroundView addSubview:tableView];
    self.tableView = tableView;
    
    _tableViewBottonConstraint = [NSLayoutConstraint constraintWithItem:tableView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:tableViewBackgroundView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0];
    
    
    [tableViewBackgroundView addConstraints:@[[NSLayoutConstraint constraintWithItem:tableView
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:tableViewBackgroundView
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1
                                                                            constant:0],
                                              
                                              _tableViewBottonConstraint,
                                              
                                              [NSLayoutConstraint constraintWithItem:tableView
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:tableViewBackgroundView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1
                                                                            constant:0],
                                              
                                              [NSLayoutConstraint constraintWithItem:tableView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:tableViewBackgroundView
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1
                                                                            constant:0]
                                              ]];
    
    UITapGestureRecognizer * bassScrollTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizer)];
    bassScrollTap.delegate = self;
    [tableView addGestureRecognizer:bassScrollTap];
}

-(void)setDelegate:(id<XQTitleMeunViewDelegate>)delegate
{
    _delegate = delegate;
    
    [self reloadData];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _currentSubIndex;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XQTitleMeunCell *cell = [XQTitleMeunCell titleMeunCellWithTableView:tableView];
    
    if ([self.delegate respondsToSelector:@selector(titleMeunView:cellForRowAtIndexPath:)]) {
        cell.textLabel.text = [self.delegate titleMeunView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:[self.typeView.subviews indexOfObject:_selectBtn]]];
    }
    
    
    return cell;
}



#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *meunIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:[self.typeView.subviews indexOfObject:_selectBtn]];
    
    if ([self.delegate respondsToSelector:@selector(titleMeunView:didSelectRowAtIndexPath:)]) {
        [self.delegate titleMeunView:self didSelectRowAtIndexPath:meunIndexPath];
    }
    
    [self titleMeunButtonDidClick:_selectBtn];
    
    if([self.delegate respondsToSelector:@selector(titleMeunView:titleAtIndexPath:)]){
        NSString *title = [self.delegate titleMeunView:self titleAtIndexPath:meunIndexPath];
        [self.typeView.subviews[meunIndexPath.section] setTitle:title forState:UIControlStateNormal];
    }else if ([self.delegate respondsToSelector:@selector(titleMeunView:cellForRowAtIndexPath:)]) {
        NSString *title = [self.delegate titleMeunView:self cellForRowAtIndexPath:meunIndexPath];
        [self.typeView.subviews[meunIndexPath.section] setTitle:title forState:UIControlStateNormal];
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch
{
    if (touch.view == self.tableView) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 自定义
-(void)cleanTypeList
{
    if (_selectBtn) {
        _selectBtn.selected = NO;
        _currentSubIndex = 0;
        _selectBtn = nil;
        
        _tableViewBottonConstraint.constant = 0;
        
        if (self.selfHeightConstraint) {
            
            self.selfHeightConstraint.constant = MUEUN_HEIGHT;
        } else {
            CGRect frame = self.frame;
            frame.size.height = MUEUN_HEIGHT;
            self.frame = frame;
        }

    }
}

#pragma mark - 点击事件
-(void)titleMeunButtonDidClick:(XQTitleMeunButton *) btn
{
    
    if (_selectBtn == btn && _selectBtn.selected) {
        [self cleanTypeList];
    } else {
        _selectBtn.selected = NO;
        btn.selected = YES;
        _selectBtn = btn;
        
        NSInteger section = [self.typeView.subviews indexOfObject:btn];
        
        _currentSubIndex = [self.delegate titleMeunView:self numberOfRowsInSection:section];
        
        if (self.selfHeightConstraint) {
            self.selfHeightConstraint.constant = [UIScreen mainScreen].bounds.size.height - _navHeight;
        }else{
            CGRect frame = self.frame;
            frame.size.height = [UIScreen mainScreen].bounds.size.height - _navHeight;
            self.frame = frame;
        }
        
        _tableViewBottonConstraint.constant = -MUEUN_HEIGHT;
        
        [self.tableView reloadData];
        
        if([self.delegate respondsToSelector:@selector(titleMeunView:currentSelectRowsInSection:)]){
            NSInteger row = [self.delegate titleMeunView:self currentSelectRowsInSection:section];
            
            [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        }
    }
}

-(void)tableViewBackgroundViewDidClick
{
    [self titleMeunButtonDidClick:_selectBtn];
}

-(void)tapGestureRecognizer
{
    [self tableViewBackgroundViewDidClick];
}

#pragma mark - 
- (NSLayoutConstraint *)selfHeightConstraint
{
    if (!_selfHeightConstraint) {
        
        static BOOL constraint;
        
        if (constraint) {
            return _selfHeightConstraint;
        }
        
        for (NSLayoutConstraint * constraint in self.constraints) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight && constraint.firstItem == self) {
                _selfHeightConstraint = constraint;
            }
        }
        
        if (!_selfHeightConstraint) {
            constraint = YES;
        }
        
    }
    return _selfHeightConstraint;
}

@end
