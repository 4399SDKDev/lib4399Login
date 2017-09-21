//
//  M4399Handler.h
//  lib4399Login
//
//  Created by weichenchao on 2017/8/28.
//  Copyright © 2017年 4399 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M4399Handler : NSObject
#pragma mark - 子类需要重载的类
+(void)load;
+ (M4399Handler *)defaultManager;

#pragma mark -


-(BOOL)isInstall;
-(BOOL)handleOpenUrl:(NSURL *)url;
-(void)sendAuthRequest;
-(void)setAppId:(NSString *)appId url:(NSString *)url;

@end
