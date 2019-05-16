//
//  OneFreshView.h
//  UIViewDemo
//
//  Created by 纵昂 on 2019/5/15.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol  OneFreshView_ViewDelegate <NSObject>

-(void)OneFreshView_oneView_back;

@end

@interface OneFreshView : UIView

@property(nonatomic,assign) id<OneFreshView_ViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
/**
 iOS开发-之UIView属性hidden, opaque, alpha, opacity的区别
 一、alpha
 液晶显示器是由一个个的像素点组成的，每个像素点都可以显示一个由RGBA颜色空间组成的一种色值。其中的A就表示透明度alpha，UIView中alpha是一个浮点值，取值范围0~1.0,表示从完全透明到完全不透明。
 1、alpha会影响自己的透明度，同时也会影响subView的透明度。
 2、alpha设为空之后，UIView不会从响应者链中移除，仍然可以收到event。
 3、更改alpha，默认是有动画效果的，这是因为图层在Cocoa中是由Core Animation中CALayer表示的，该动画效果是CALayer的隐含动画。当然也有办法禁用此动画效果
 
 二、hidden
 该属性为BOOL值，用来表示UIView是否隐藏，默认值是NO。
 当值设为YES时:
 1、当前的UIView和subview都会被隐藏，而不管subview的hidden值为多少。
 2、当前UIView会从响应者链中移除，而响应者链中的下一个会成为第一响应者
 
 三、alpha - hidden 比较
 1、对subView的影响： alpha会影响subView透明度，hidden也会影响subView
 2、隐藏UIView： alpha设置为0可以隐藏UIView，hidden设置为YES也可以隐藏UIVIew，效果是一样的，使用hidden性能较高。
 四、opaque
 该属性为BOOL值，UIView的默认值是YES，但UIButton等子类的默认值都是NO。opaque表示当前UIView是否不透明，不过搞笑的是事实上它却决定不了当前UIView是不是不透明，比如你将opaque设为NO，该UIView照样是可见的。其作用在于：给绘图系统提供一个性能优化开关。如果该值为YES，那么绘图在绘制该视图的时候把整个视图当做不透明对待。这样，绘图系统在执行绘图过程中会优化一些操作并提供系统性能；如果是设置为NO，绘图系统将其和其他内容平等对待，不去做优化操作。为了性能方面的考量，默认被置为YES（意味着优化）。
 1、UIView当有背景颜色时：并且背景颜色有透明度(透明度不为1时),将opaque设置为YES性能较高。
 2、UIVIew有背景颜色时：并且背景颜色的透明度为1，opaque的值不影响性能。
 3、UIVIew没有背景颜色时：opaque的值不影响性能。
 
 五、opacity - CALayer的属性
 CALayer中opacity是一个浮点值，取值范围0~1.0,表示从完全透明到完全不透明。
 1、opacity会影响自己的透明度，同时也会影响subLayer的透明度。
 2、opacity设为空之后，CALayer不会从响应者链中移除，仍然可以收到event。
 
 六、如何设置UIView透明，subView不透明
 1、使用一张半透明的图片做背景。
 这个方法可以达到要求，但是工程中应该尽量少加入资源，能不用图片的尽量不用图片。
 2、使用colorWithWhite：alpha：方法
 view.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
 这也是使用比较多的方法，white后面的参数表示灰度，从0-1之间表示从黑到白的变化，alpha就是想要调整的透明度。
 3、使用colorWithRed:green:blue:alpha:方法
 设置alpha就是想要调整的透明度。
 
 
 
 **/
