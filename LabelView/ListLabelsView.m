//
//  ListLabelsView.m
//  LabelView
//
//  Created by bo on 15/12/28.
//  Copyright © 2015年 com.pencho.com. All rights reserved.
//

#import "ListLabelsView.h"

@interface ListLabelsView()
@property (nonatomic,strong)NSMutableArray *labelArray;
@property (nonatomic,strong)NSMutableArray *textColrArray;
@property (nonatomic,strong)NSMutableArray *backGroundColorArray;

@property (nonatomic,readwrite,assign)CGSize listViewSize;

@end

@implementation ListLabelsView

- (NSMutableArray *)labelArray {
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

- (NSMutableArray *)textColrArray {
    if (!_textColrArray) {
        _textColrArray = [NSMutableArray array];
    }
    return _textColrArray;
}

- (NSMutableArray *)backGroundColorArray {
    if (!_backGroundColorArray) {
        _backGroundColorArray = [NSMutableArray array];
    }
    return _backGroundColorArray;
}

- (void)setLabels:(NSArray *)lablesArray backGroundViewColor:(NSArray *)backColorArray {
    [self.labelArray addObjectsFromArray:lablesArray];
    [self.backGroundColorArray addObjectsFromArray:backColorArray];
}

- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray {
    [self.labelArray addObjectsFromArray:lablesArray];
    [self.textColrArray addObjectsFromArray:textColorArray];
}

- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray backGroundViewColor:(NSArray *)backColorArray {
    [self.labelArray addObjectsFromArray:lablesArray];
    [self.textColrArray addObjectsFromArray:textColorArray];
    [self.backGroundColorArray addObjectsFromArray:backColorArray];
}

- (void)addSubViews {
    if (self.labelArray.count == 0) {
        self.listViewSize = CGSizeZero;
        return;
    }
    
    NSInteger startCountX = 0,startCountY = 0;
    for (int i = 0 ; i < self.labelArray.count ; i++) {
        id object = self.labelArray[i];
        if ([object isKindOfClass:[NSArray class]]) {
            NSArray *labelSubArray = (NSArray *)object;
            for (int j = 0; j < labelSubArray.count; j++) {
                
            }
        }else {
        
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
