//
//  NSObject+JsonModel.m
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//


/*
 Ivar ivar1;
 Ivar ivar2;
 Ivar ivar3;
 Ivar a[] = {ivar3,ivar1,ivar2};
 Ivar *ivar = &a;
 
 */


#import "NSObject+JsonModel.h"
#import <objc/message.h>
@implementation NSObject (JsonModel)

+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    id objc = [[self alloc]init];
    unsigned int count = 0;
    //class_copyIvarList:把成员属性列表复制一份
    //指向Ivar指针 用count接收，返回属性总数
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0 ; i < count; i++) {
        // 获取成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员名
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        ;
        // 成员属性类型
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 获取key
        NSString *key = [propertyName substringFromIndex:1];
        
        // 获取字典的value
        id value = dict[key];
        // 给模型的属性赋值
        // value:字典的值
        // key:属性名
        // 二级转换
        // 值是字典,成员属性的类型不是字典,才需要转换成模型
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) { // 需要字典转换成模型
            // 转换成哪个类型
            
            // @"@\"User\"" User
            NSRange range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.location + range.length];
            // User\"";
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:range.location];
            
            // 字符串截取
            
            // 获取需要转换类的类对象
            
            Class modelClass =  NSClassFromString(propertyType);
            
            if (modelClass) {
                value =  [modelClass modelWithDict:value];
                
            }
        }
        // 三级转换：NSArray中也是字典，把数组中的字典转换成模型.
        // 判断值是否是数组
        if ([value isKindOfClass:[NSArray class]]) {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(ws_objectClassInArray)]) {
                
                // 转换成id类型，就能调用任何对象的方法
                id idSelf = self;
                
                // 获取数组中字典对应的模型
                NSString *type =  [idSelf ws_objectClassInArray][key];
                
                // 生成模型
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                // 遍历字典数组，生成模型数组
                for (NSDictionary *dict in value) {
                    // 字典转模型
                    id model =  [classModel modelWithDict:dict];
                    [arrM addObject:model];
                }
                
                // 把模型数组赋值给value
                value = arrM;
                
            }
        }

        
        if (!value) {
            // 获取key
            NSString *propertyKey = [propertyName substringFromIndex:1];
            if ([self respondsToSelector:@selector(ws_objectClassInArray)]) {
                key = [[self class] ws_replacedKeyFromPropertyName][propertyKey];
                
                id replacedValue = dict[key];
                if (replacedValue) {
                    [objc setValue:replacedValue forKey:propertyKey];
                }
            }
        }

        
        
        if (value) {
            // KVC赋值:不能传空
            [objc setValue:value forKey:key];
            
        }
        
        // 查看有没有需要替换的key

        //        NSLog(@"%@",key);
//                NSLog(@"%@ %@",propertyType , propertyName);
    }
    
    return objc;
}

@end
