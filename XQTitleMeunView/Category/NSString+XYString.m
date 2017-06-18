//
//  NSString+XYString.m
//  EasyFamily
//
//  Created by mac-2016 on 17/2/22.
//  Copyright © 2017年 陈嘉健. All rights reserved.
//

#import "NSString+XYString.h"

#define IOS_VERSION_7_OR_ABOVE ([UIDevice currentDevice].systemVersion.floatValue > 7)

@implementation NSString (XYString)


/// 根据字符算长度
-(CGSize) sizeWithMaxSize:(CGSize) size font: (UIFont *) font
{
#ifdef IOS_VERSION_7_OR_ABOVE
    NSDictionary *attr = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
#else
    return [self sizeWithFont:font  constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#endif
}



@end
