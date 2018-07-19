//
//  UIView+JHFrameLayout.m
//  JHKit
//
//  Created by HaoCold on 2018/1/12.
//  Copyright © 2018年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2018 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UIView+JHFrameLayout.h"

@interface JH_HELPER_CLASS_UIView_JHFrameLayout:NSObject @end
@implementation JH_HELPER_CLASS_UIView_JHFrameLayout @end

@implementation UIView (JHFrameLayout)

#pragma mark - public

#pragma mark --- size, center, origin
- (void)jh_sizeIs:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)jh_centerIs:(CGPoint)center{
    self.center = center;
}

- (void)jh_originIs:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

#pragma mark --- width
- (void)jh_widthIs:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)jh_widthIsEqualToView:(UIView *)view{
    [self jh_widthIs:1 ratioOfViewWidth:view];
}

- (void)jh_widthIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view{
    [self jh_widthIs:view.frame.size.width * ratio];
}

- (void)jh_widthIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view{
    [self jh_widthIs:view.frame.size.height * ratio];
}

#pragma mark --- height
- (void)jh_heightIs:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)jh_heightIsEqualToView:(UIView *)view{
    [self jh_heightIs:1 ratioOfViewHeight:view];
}

- (void)jh_heightIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view{
    [self jh_heightIs:view.frame.size.width * ratio];
}

- (void)jh_heightIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view{
    [self jh_heightIs:view.frame.size.height * ratio];
}

#pragma mark --- top
- (void)jh_topIs:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)jh_topIsEqualToView:(UIView *)view{
    [self jh_topIs:CGRectGetMinY(view.frame)];
}

- (void)jh_topIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_topIs:offsetY fromView:view add:0 updateHeight:flag];
}

- (void)jh_topIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_topIs:offsetY fromView:view add:view.frame.size.height*0.5 updateHeight:flag];
}

- (void)jh_topIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_topIs:offsetY fromView:view add:view.frame.size.height updateHeight:flag];
}

#pragma mark --- left
- (void)jh_leftIs:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)jh_leftIsEqualToView:(UIView *)view{
    [self jh_leftIs:CGRectGetMinX(view.frame)];
}

- (void)jh_leftIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_leftIs:offsetX fromView:view add:0 updateWidth:flag];
}

- (void)jh_leftIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_leftIs:offsetX fromView:view add:view.frame.size.width*0.5 updateWidth:flag];
}

- (void)jh_leftIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_leftIs:offsetX fromView:view add:view.frame.size.width updateWidth:flag];
}

#pragma mark --- bottom
- (void)jh_bottomIs:(CGFloat)bottom{
    if (self.superview) {
        CGRect frame = self.frame;
        if (frame.size.height > 0) {
            frame.origin.y = self.superview.frame.size.height + bottom - frame.size.height;
        }else{
            frame.size.height = self.superview.frame.size.height + bottom - frame.origin.y;
        }
        self.frame = frame;
    }
}

- (void)jh_bottomIsEqualToView:(UIView *)view{
    [self jh_bottomIs:CGRectGetMaxY(view.frame)];
}

- (void)jh_bottomIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_bottomIs:offsetY fromView:view add:0 updateHeight:flag];
}

- (void)jh_bottomIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_bottomIs:offsetY fromView:view add:-view.frame.size.height*0.5 updateHeight:flag];
}

- (void)jh_bottomIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_bottomIs:offsetY fromView:view add:-view.frame.size.height updateHeight:flag];
}

#pragma mark --- right
- (void)jh_rightIs:(CGFloat)right{
    if (self.superview) {
        CGRect frame = self.frame;
        if (frame.size.width > 0) {
            frame.origin.x = self.superview.frame.size.width + right - frame.size.width;
        }else{
            frame.size.width = self.superview.frame.size.width + right - frame.origin.x;
        }
        self.frame = frame;
    }
}

- (void)jh_rightIsEqualToView:(UIView *)view{
    [self jh_rightIs:CGRectGetMaxX(view.frame)];
}

- (void)jh_rightIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_rightIs:offsetX fromView:view add:0 updateWidth:flag];
}

- (void)jh_rightIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_rightIs:offsetX fromView:view add:-view.frame.size.width*0.5 updateWidth:flag];
}

- (void)jh_rightIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_rightIs:offsetX fromView:view add:-view.frame.size.width updateWidth:flag];
}

#pragma mark --- center X
- (void)jh_centerXIs:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)jh_centerXIsEqualToView:(UIView *)view{
    if (self.superview == view) {
        [self jh_centerXIs:CGRectGetWidth(view.frame)*0.5];
    }else{
        [self jh_centerXIs:CGRectGetMidX(view.frame)];
    }
}

- (void)jh_centerXIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_centerXIs:offsetX fromView:view type:0 updateWidth:flag];
}

- (void)jh_centerXIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_centerXIs:offsetX fromView:view type:1 updateWidth:flag];
}

- (void)jh_centerXIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag{
    [self xx_centerXIs:offsetX fromView:view type:2 updateWidth:flag];
}

#pragma mark --- center Y
- (void)jh_centerYIs:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)jh_centerYIsEqualToView:(UIView *)view{
    if (self.superview == view) {
        [self jh_centerYIs:CGRectGetHeight(view.frame)*0.5];
    }else{
        [self jh_centerYIs:CGRectGetMidY(view.frame)];
    }
}

- (void)jh_centerYIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_centerYIs:offsetY fromView:view type:0 updateHeight:flag];
}

- (void)jh_centerYIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_centerYIs:offsetY fromView:view type:1 updateHeight:flag];
}

- (void)jh_centerYIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag{
    [self xx_centerYIs:offsetY fromView:view type:2 updateHeight:flag];
}

#pragma mark - private

- (CGPoint)xx_originConvertFromView:(UIView *)view{
    
    NSSet *set1 = [self allSuperViewOfView:view];
    NSSet *set2 = [self allSuperViewOfView:self];
    
    UIView *superView = view.superview ? view.superview : view;
    CGPoint origin = [superView convertPoint:view.frame.origin toView:self.superview];
    
    // When 'view' and 'self' has no common superview, use view's origin.
    if (![set1 intersectsSet:set2]) {
        origin = view.frame.origin;
    }
    
    return origin;
}

- (void)xx_topIs:(CGFloat)offsetY fromView:(UIView *)view add:(CGFloat)increment updateHeight:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGRect frame = self.frame;
    if (flag) {
        frame.size.height = frame.origin.y + frame.size.height - offsetY;
        frame.origin.y = origin.y + offsetY + increment;
        if (frame.size.height < 0) {
            frame.size.height = 0;
        }
    }else{
        frame.origin.y = origin.y + offsetY + increment;
    }
    self.frame = frame;
}

- (void)xx_leftIs:(CGFloat)offsetX fromView:(UIView *)view add:(CGFloat)increment updateWidth:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGRect frame = self.frame;
    if (flag) {
        frame.size.width = frame.origin.x + frame.size.width - offsetX;
        frame.origin.x = origin.x + offsetX + increment;
        if (frame.size.width < 0) {
            frame.size.width = 0;
        }
    }else{
        frame.origin.x = origin.x + offsetX + increment;
    }
    self.frame = frame;
}

- (void)xx_bottomIs:(CGFloat)offsetY fromView:(UIView *)view add:(CGFloat)increment updateHeight:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGRect frame = self.frame;
    if (flag) {
        frame.size.height = origin.y + view.frame.size.height + offsetY + increment - self.frame.origin.y;
    }else{
        frame.origin.y = origin.y + view.frame.size.height + offsetY + increment - self.frame.size.height;
    }
    self.frame = frame;
}

- (void)xx_rightIs:(CGFloat)offsetX fromView:(UIView *)view add:(CGFloat)increment updateWidth:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGRect frame = self.frame;
    if (flag) {
        frame.size.width = origin.x + view.frame.size.width + offsetX + increment - self.frame.origin.x;
    }else{
        frame.origin.x = origin.x + view.frame.size.width + offsetX + increment - self.frame.size.width;
    }
    self.frame = frame;
}

- (void)xx_centerXIs:(CGFloat)offsetX fromView:(UIView *)view type:(NSInteger)type updateWidth:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGFloat centerX = CGRectGetMidX(self.frame);
    if (0 == type) { // left
        if (centerX <= origin.x) {
            [self jh_rightIs:self.frame.size.width*0.5+offsetX fromLeftOfView:view updateWidth:flag];
        }else{
            [self jh_leftIs:-self.frame.size.width*0.5+offsetX fromLeftOfView:view updateWidth:flag];
        }
    }else if (1 == type){ // middle
        if (centerX <= origin.x + view.frame.size.width*0.5) {
            [self jh_rightIs:self.frame.size.width*0.5+offsetX fromMiddleOfView:view updateWidth:flag];
        }else{
            [self jh_leftIs:-self.frame.size.width*0.5+offsetX fromMiddleOfView:view updateWidth:flag];
        }
    }else{ // right
        if (centerX <= origin.x + view.frame.size.width) {
            [self jh_rightIs:self.frame.size.width*0.5+offsetX fromRightOfView:view updateWidth:flag];
        }else{
            [self jh_leftIs:-self.frame.size.width*0.5+offsetX fromRightOfView:view updateWidth:flag];
        }
    }
}

- (void)xx_centerYIs:(CGFloat)offsetY fromView:(UIView *)view type:(NSInteger)type updateHeight:(BOOL)flag{
    CGPoint origin = [self xx_originConvertFromView:view];
    CGFloat centerY = CGRectGetMidY(self.frame);
    if (0 == type) { // top
        if (centerY <= origin.y) {
            [self jh_bottomIs:self.frame.size.height*0.5+offsetY fromTopOfView:view updateHeight:flag];
        }else{
            [self jh_topIs:-self.frame.size.height*0.5+offsetY fromTopOfView:view updateHeight:flag];
        }
    }else if (1 == type){ // middle
        if (centerY <= origin.y + view.frame.size.height*0.5) {
            [self jh_bottomIs:self.frame.size.height*0.5+offsetY fromMiddleOfView:view updateHeight:flag];
        }else{
            [self jh_topIs:-self.frame.size.height*0.5+offsetY fromMiddleOfView:view updateHeight:flag];
        }
    }else{ // bottom
        if (centerY <= origin.y + view.frame.size.height) {
            [self jh_bottomIs:self.frame.size.height*0.5+offsetY fromBottomOfView:view updateHeight:flag];
        }else{
            [self jh_topIs:-self.frame.size.height*0.5+offsetY fromBottomOfView:view updateHeight:flag];
        }
    }
}

- (NSSet *)allSuperViewOfView:(UIView *)view
{
    NSMutableArray *marr = @[].mutableCopy;
    UIView *superview = view.superview;
    while (superview) {
        [marr addObject:superview];
        superview = superview.superview;
    }
    // NSLog(@"allSuperViewOfView:%@",marr);
    return [NSSet setWithArray:marr];
}

@end
