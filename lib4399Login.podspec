
Pod::Spec.new do |s|
    s.name             = 'lib4399Login'
    s.version          = '0.0.1'
    s.summary          = '4399登录SDK第二版'


    s.description      = '4399登录SDK，基于第一版增加第三方SSO登录授权'

    s.homepage         = 'https://github.com/4399SDKDev/lib4399Login'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'fmricky' => 'zhengxu@4399inc.com' }
    s.source           = { :git => 'https://github.com/4399SDKDev/lib4399Login.git', :tag => s.version.to_s }

    s.ios.deployment_target = '7.0'

    s.default_subspec = 'All'



    s.subspec 'Core' do |c|
        c.resource = 'lib4399Login/Assets/lib4399LoginBundle.bundle'
        c.library = 'sqlite3'
        c.framework = 'CoreGraphics','SystemConfiguration'
        c.vendored_framework = 'lib4399Login/Classes/lib4399Login.framework'
        #c.source_files = 'lib4399Login/Classes/lib4399Login.framework/Headers/*.h'
        c.user_target_xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(inherited)"}

    end

    s.subspec 'WeChat' do |wc|
        wc.vendored_libraries = 'lib4399Login/M4399SocialSDK/Wechat/WechatLogin/libWechat.a'
        wc.source_files = 'lib4399Login/M4399SocialSDK/Wechat/WechatLogin/*.h'
        wc.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/Wechat/WechatLogin/**" }
        wc.dependency 'lib4399Login/Core'
        wc.dependency 'WechatOpenSDK', '~> 1.7.8'
        wc.required_query_schemes = ["wechat", "weixin"]
    end

    s.subspec 'QQ' do |qq|
        qq.vendored_libraries = 'lib4399Login/M4399SocialSDK/QQ/QQLogin/libQQLogin.a'
        qq.source_files = 'lib4399Login/M4399SocialSDK/QQ/QQLogin/*.h'
        qq.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/QQ/QQLogin/**" }
        qq.dependency 'lib4399Login/Core'
        qq.dependency 'QQOpenSDK', '~> 3.2.1'
        qq.required_query_schemes = ["mqqapi", "mqq","mqqOpensdkSSoLogin","mqqconnect","mqqopensdkdataline","mqqopensdkgrouptribeshare","mqqopensdkfriend","mqqopensdkapi","mqqopensdkapiV2","mqqopensdkapiV3","mqqopensdkapiV4","mqzoneopensdk","wtloginmqq","wtloginmqq2","mqqwpa","mqzone","mqzonev2","mqzoneshare","wtloginqzone","mqzonewx","mqzoneopensdkapiV2","mqzoneopensdkapi19","mqzoneopensdkapi","mqqbrowser","mttbrowser","tim","timapi","timopensdkfriend","timwpa","timgamebindinggroup","timapiwallet","timOpensdkSSoLogin","wtlogintim","timopensdkgrouptribeshare","timopensdkapiV4","timgamebindinggroup","timopensdkdataline","wtlogintimV1","timapiV1"]
        
    end

    s.subspec 'Weibo' do |wb|
        wb.vendored_libraries = 'lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/libSinaLogin.a'
        wb.source_files = 'lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/*.h','lib4399Login/M4399SocialSDK/Weibo/libWeiboSDK/*.h'
        wb.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/lib4399Login/M4399SocialSDK/Weibo/WeiboLogin/**" }
        wb.dependency 'lib4399Login/Core'
        wb.dependency 'VPWeiboSDK', '~> 3.2.0'
        wb.required_query_schemes = ["sinaweibohd", "sinaweibo","sinaweibosso","weibosdk","weibosdk2.5"]
    end

    s.subspec 'All' do |a|
        a.dependency 'lib4399Login/Core'
        a.dependency 'lib4399Login/WeChat'
        a.dependency 'lib4399Login/QQ'
        a.dependency 'lib4399Login/Weibo'
    end

end
