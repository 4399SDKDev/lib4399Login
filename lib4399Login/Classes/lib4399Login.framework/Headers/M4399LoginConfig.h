//
//  M4399Config.h
//  lib4399Login
//
//  Created by 郑旭 on 2017/7/4.
//  Copyright © 2017年 4399 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, M4399InterfaceOrientation) {
    M4399InterfaceOrientationLandscape = 1,      //横屏
    M4399InterfaceOrientationPortrait = 2,       //竖屏
};
typedef NS_ENUM(NSInteger,M4399LoginPlatformType) {
    //预定义的平台
    M4399LoginPlatformType_UnKnown    = -1,
    M4399LoginPlatformType_Sina               = 0, //新浪微博
    M4399LoginPlatformType_Wechat      = 1, //QQ
    M4399LoginPlatformType_QQ     = 2,//微信
};
@interface M4399LoginConfig : NSObject

#pragma mark 必填字段
/**
 *  游戏版本，游戏方接入时分配
 */
@property(nonatomic, strong, nonnull) NSString *gameId;

#pragma mark 选填字段

/**
 *  横竖屏选择，默认为横屏
 */
@property (nonatomic,assign) M4399InterfaceOrientation  supportedInterfaceOrientations;
/**
 *  ipv6环境
 */
@property (nonatomic,assign) BOOL  isIpv6;

/**
 配置信息

 @param gameId  游戏版本，游戏方接入时分配
 @param gameKey 游戏key，游戏方接入时分配
 @param supportedInterfaceOrientations 横竖屏选择，默认为横屏
 @return 示例
 */
- (instancetype _Nonnull)initWithGameId:(NSString *_Nonnull)gameId gameKey:(NSString *_Nonnull)gameKey  supportedInterfaceOrientations:(M4399InterfaceOrientation)supportedInterfaceOrientations;

@end
