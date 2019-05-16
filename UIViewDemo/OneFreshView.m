//
//  OneFreshView.m
//  UIViewDemo
//
//  Created by 纵昂 on 2019/5/15.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import "OneFreshView.h"

@interface OneFreshView ()

@end

@implementation OneFreshView

-(instancetype)init
{
    self = [super init];
    if(self){
        [self setAttribute];
        [self createView];
    }
    return self;
}
-(void)setAttribute
{
    self.backgroundColor = [UIColor redColor];
    
}
-(void)createView
{
    
}
-(void)layoutSubviews{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
