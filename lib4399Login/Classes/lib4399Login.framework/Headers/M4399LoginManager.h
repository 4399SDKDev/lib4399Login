//
//  M4399LoginManager.h
//  lib4399Login
//
//  Created by 郑旭 on 2017/7/4.
//  Copyright © 2017年 4399 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M4399LoginConfig.h"

@protocol M4399LoginManagerDelegate <NSObject>

@optional
/**
 退出登录成功回调
 */
- (void)managerDidLogoutSuccess;

/**
 登录失败回调
 */
- (void)managerDidLoginFailure:(NSString *_Nullable)message;

/**
 登录成功回调

 @param uid 用户id
 @param nickName 用户昵称
 @param avatar 用户头像
 */
- (void)managerDidLoginSuccess:(NSString *_Nullable)uid withNick:(NSString *_Nullable)nickName withAvatar:(NSString *_Nullable)avatar;

@end


@interface M4399LoginManager : NSObject
/**
 配置SDK
 
 config 配置类实例
 
 */
@property(nonatomic, strong, nonnull) M4399LoginConfig *config;
/**
 配置SDK
 
 代理
 
 */
@property (nonatomic, assign) id <M4399LoginManagerDelegate> delegate;

/**
 获取M4399LoginManager单例
 
 @return M4399LoginManager单例
 */
+ (instancetype _Nonnull )sharedManager;


/**
 发送登录请求，显示登录界面或校验信息直接登录
 */
- (void)m4399_sendAuthRequet;

/**
 退出账户
 */
- (void)m4399_logout;


/**
 *  获得从sso或者web端回调到本app的回调
 *
 *  @param url 第三方sdk的打开本app的回调的url
 *
 *  @return 是否处理  YES代表处理成功，NO代表不处理
 */
- (BOOL)m4399_handleOpenURL:(nonnull NSURL *)url;

/**
 *  设置平台的appkey
 *
 *  @param platformType 平台类型 @see M4399LoginPlatformType
 *  @param appKey       第三方平台的appKey（QQ平台为appID）
 *  @param redirectURL  redirectURL
 */
- (void)m4399_setPlaform:(M4399LoginPlatformType)platformType
            appKey:(NSString *_Nonnull)appKey
       redirectURL:(NSString *_Nullable)redirectURL;
@end

