//
//  Status.m
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "Status.h"

@implementation Status

+ (NSDictionary *)ws_objectClassInArray
{
    return @{@"pic_urls" : @"Picture"};
}


+ (NSDictionary *)ws_replacedKeyFromPropertyName{
    
    return @{@"ID" : @"id",
             @"sourceID":@"source"
             };
}
//+ (Status *)statusWithDict:(NSDictionary *)dict
//{
//    Status *status = [[self alloc] init];
//    
//    // KVC
//    [status setValuesForKeysWithDictionary:dict];
//    
//    return status;
//}
//
//// 解决KVC报错
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    if ([key isEqualToString:@"id"]) {
//        _ID = [value integerValue];
//    }
//    // key:没有找到key
//    // value:没有找到key对应的值
//    NSLog(@"%@ %@",key,value);
//}
@end
