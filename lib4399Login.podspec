
Pod::Spec.new do |s|
    s.name             = 'lib4399Login'
    s.version          = '0.0.1'
    s.summary          = '4399登录SDK第二版'


    s.description      = '4399登录SDK，基于第一版增加第三方SSO登录授权'

    s.homepage         = 'https://github.com/4399SDKDev/lib4399Login'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'fmricky' => 'zhengxu@4399inc.com' }
    s.source           = { :git => 'https://github.com/4399SDKDev/lib4399Login.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.ios.deployment_target = '7.0'

    s.default_subspec = 'All'



    s.subspec 'Core' do |c|
        c.resource = 'lib4399Login/Assetslib4399LoginBundle.bundle'
        c.library = 'sqlite3'
        c.framework = 'CoreGraphics','SystemConfiguration'
        c.vendored_framework = 'lib4399Login/Classes/lib4399Login.framework'
        c.source_files = 'lib4399Login/Classes/lib4399Login.framework/Headers/*.h'
        c.user_target_xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(inherited)"}

    end

    s.subspec 'WeChat' do |wc|
        wc.library = 'c++','z'
        wc.framework = 'CoreTelephony'
        wc.vendored_libraries = 'lib4399Login/M4399SocialSDK/Wechat/WechatLogin/libWechat.a','lib4399Login/M4399SocialSDK/Wechat/Wechat/libWeChatSDK.a'
        wc.source_files = 'lib4399Login/M4399SocialSDK/Wechat/WechatLogin/*.h','lib4399Login/M4399SocialSDK/Wechat/Wechat/*.h'
        wc.dependency 'lib4399Login/Core'
        wc.xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/Wechat/WechatLogin/** $(PODS_ROOT)/lib4399Login/M4399SocialSDK/Wechat/Wechat/**" }
    end

    s.subspec 'QQ' do |qq|
        qq.resource = 'lib4399Login/M4399SocialSDK/QQ/libQQ/TencentOpenApi_IOS_Bundle.bundle'
        qq.library = 'c++'
        qq.vendored_libraries = 'lib4399Login/M4399SocialSDK/QQ/QQLogin/libQQLogin.a'
        qq.vendored_framework = 'lib4399Login/M4399SocialSDK/QQ/libQQ/TencentOpenAPI.framework'
        qq.source_files = 'lib4399Login/M4399SocialSDK/QQ/libQQ/TencentOpenAPI.framework/Headers/*.h','lib4399Login/M4399SocialSDK/QQ/QQLogin/*.h'
        qq.dependency 'lib4399Login/Core'
        qq.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/QQ/QQLogin/ $(PODS_ROOT)/lib4399Login/M4399SocialSDK/QQ/libQQ/**" }
    end

    s.subspec 'Weibo' do |wb|
        wb.library = 'z'
        wb.framework = 'CoreTelephony'
        wb.vendored_libraries = 'lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/libSinaLogin.a','lib4399Login/M4399SocialSDK/Weibo/libWeiboSDK/libWeiboSDK.a'
        wb.source_files = 'lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/*.h','lib4399Login/M4399SocialSDK/Weibo/libWeiboSDK/*.h'
        wb.dependency 'lib4399Login/Core'
        wb.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/** $(PODS_ROOT)/lib4399Login/M4399SocialSDK/Weibo/libWeiboSDK/**" }
    end

    s.subspec 'All' do |a|
        a.dependency 'lib4399Login/Core'
        a.dependency 'lib4399Login/WeChat'
        a.dependency 'lib4399Login/QQ'
        a.dependency 'lib4399Login/Weibo'
    end

end
