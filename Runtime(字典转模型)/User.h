//
//  User.h
//  Runtime(字典转模型)
//
//  Created by 袁伟森 on 2017/12/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, strong) NSString *profile_image_url;

@property (nonatomic, assign) BOOL vip;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) int mbrank;

@property (nonatomic, assign) int mbtype;

@end
