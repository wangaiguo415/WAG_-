# -工具组件-

<!--# 为啥已女神为名称呢?-->

<!--## 主要就是我的女神太美丽、太漂亮、太吸引人 以至于我的脑海里只剩下我的女神 -->
-------------

# 本工程主要以三方为主，简单的介绍下其常用用法，并且附带下自己的一些小心得，  


**1 YUSegment**  

*这个是通用的横向滑条创建、用法简单*
```
代码~~~~
```

**2 提示信息**  

*通过对MBProgressHUD的简单封装 实现全局调用及提示信息的作用*

**3 照片拍照**  

*简单的对本地图片选择和拍照做了封装 调用方便*

**4 图片镜像处理**  

*可以对图片进行翻转、对称、中心点旋转*

**5 对UIButton、UILabel、UITextField进行的链式封装**  

*比如textField可以这样初始化并设置一些属性*
```
UITextField *textField = [UITextField createField:^(UITextField * _Nonnull textField) {
textField.wag_placeHolder(@"请输入......")
.wag_textColor([UIColor greenColor])
.wag_font([UIFont systemFontOfSize:20])
.keyType(UIReturnKeyDone)
.wag_frame(CGRectMake(0, SCREEN_HEIGHT - 88, SCREEN_WIDTH, 40))
.wag_backgroudColor([UIColor cyanColor])
.alignment(NSTextAlignmentCenter);
}];
```


**object-c 的规范问题** 
*6 这个算是oc的GitHub官网讲解，但感觉把它作为编码的基本规范更好点*  

[objective-c-style-guide](https://github.com/nytimes/objective-c-style-guide)  
[更详细的一些技巧及规范](http://www.cocoachina.com/articles/27054)

*7 UIView中frame属性内部的实现*  

[http://www.cocoachina.com/articles/27119]

*8 深入浅出iOS编译*  
[http://www.cocoachina.com/articles/27120#header]

*9 objc源码解析-ObjectiveC对象结构*  
[http://www.cocoachina.com/articles/27136]  

*10 Mac端Flutter的环境配置*  
[https://juejin.im/post/5d0508d56fb9a07ec373eb9e#heading-8]

*11 Mac端清理工具 非常好用*
[https://www.omnigroup.com/more/]


# 个人简书主页
[简书主页][https://www.jianshu.com/u/dd4e2568aa80]

