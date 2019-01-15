//
//  NSObject+JsonModel.h
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ModelDelegate <NSObject>

@optional
/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+ (NSDictionary *)ws_objectClassInArray;

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)ws_replacedKeyFromPropertyName;


@end
@interface NSObject (JsonModel)

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
