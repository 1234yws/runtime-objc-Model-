//
//  Status.h
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Picture.h"
@interface Status : NSObject
@property (nonatomic, assign) NSInteger ID;
// 解析字典自动生成属性代码
@property (nonatomic, strong) NSString *sourceID;

@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, strong) NSArray<Picture*> *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) int attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) int comments_count;

@property (nonatomic, strong) NSDictionary *retweeted_status;

@property (nonatomic, strong) User *user;

//+ (__kindof Status *)statusWithDict:(NSDictionary *)dict;

@end
