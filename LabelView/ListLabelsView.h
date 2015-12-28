//
//  ListLabelsView.h
//  LabelView
//
//  Created by bo on 15/12/28.
//  Copyright © 2015年 com.pencho.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListLabelsView : UIView
// 初始化页面之后View的Size
@property (nonatomic,readonly,assign)CGSize listViewSize;

// 如果所有的标签需要进行分组,则lablesArray需要传入数组(单个元素) as textColorArray and backColorArray
- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray;
- (void)setLabels:(NSArray *)lablesArray backGroundViewColor:(NSArray *)backColorArray;
- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray backGroundViewColor:(NSArray *)backColorArray;
@end
