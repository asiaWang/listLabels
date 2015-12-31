//
//  ListLabelsView.m
//  LabelView
//
//  Created by bo on 15/12/28.
//  Copyright © 2015年 com.pencho.com. All rights reserved.
//

#import "ListLabelsView.h"


#define LABEL_HEIGHT 20.f
#define MAIN_SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define LABEL_WIDTH_ADD 25.f
#define LABEL_WIDTH_SPACE 8.f
#define LABEL_HEIFHT_SPACE 5.f

typedef NS_ENUM(NSInteger,ListLabelDataType) {
    ListLabelsView_Nomal,
    ListLabelsView_Collection,
};

@interface ListLabelsView()
@property (nonatomic,strong)NSMutableArray *labelArray;
@property (nonatomic,strong)NSMutableArray *textColrArray;
@property (nonatomic,strong)NSMutableArray *backGroundColorArray;

@property (nonatomic,readwrite,assign)CGSize listViewSize;
@property (nonatomic,assign)ListLabelDataType type;
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
    [self addSubViews];
}

- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray {
    [self.labelArray addObjectsFromArray:lablesArray];
    [self.textColrArray addObjectsFromArray:textColorArray];
    [self addSubViews];
}

- (void)setLabels:(NSArray *)lablesArray textColors:(NSArray *)textColorArray backGroundViewColor:(NSArray *)backColorArray {
    [self.labelArray addObjectsFromArray:lablesArray];
    [self.textColrArray addObjectsFromArray:textColorArray];
    [self.backGroundColorArray addObjectsFromArray:backColorArray];
    [self addSubViews];
}

- (void)addSubViews {
    if (self.labelArray.count == 0) {
        self.listViewSize = CGSizeZero;
        return;
    }
    
    NSInteger startCountWith = 0,startCountY = 5;
    for (int i = 0 ; i < self.labelArray.count ; i++) {
        id object = self.labelArray[i];
        if ([object isKindOfClass:[NSArray class]]) {
            self.type = ListLabelsView_Collection;
            NSArray *labelSubArray = (NSArray *)object;
            for (int j = 0; j < labelSubArray.count; j++) {
                @autoreleasepool {
                    UILabel *label = [[UILabel alloc] init];
                    label.text = labelSubArray[j];
                    label.font = [UIFont systemFontOfSize:13.f];
                    label.textAlignment = NSTextAlignmentCenter;
                    label.backgroundColor = [UIColor orangeColor];
                    label.layer.masksToBounds = YES;
                    CGSize size = [self sizeOfLabel:label title:label.text];
                    if (size.width + LABEL_WIDTH_ADD + startCountWith + LABEL_WIDTH_SPACE > self.frame.size.width ) {
                        startCountWith = 0;
                        startCountY = startCountY + LABEL_HEIGHT + LABEL_HEIFHT_SPACE;
                        j--;
                        continue;
                    }else {
                        CGRect lFrame = CGRectMake(startCountWith + LABEL_WIDTH_SPACE, startCountY, size.width + LABEL_WIDTH_ADD, LABEL_HEIGHT);
                        label.frame = lFrame;
                        startCountWith = lFrame.origin.x + lFrame.size.width;
                    }
                    label.layer.cornerRadius = LABEL_HEIGHT / 2;
                    [self addSubview:label];
                    if (j == labelSubArray.count - 1) {
                        startCountWith = 0;
                        startCountY = startCountY + LABEL_HEIGHT + LABEL_HEIFHT_SPACE;
                    }
                }
            }
        }else {
            self.type = ListLabelsView_Nomal;
            @autoreleasepool {
                NSString *labelTitle = (NSString *)object;
                UILabel *label = [[UILabel alloc] init];
                label.text = labelTitle;
                label.font = [UIFont systemFontOfSize:13.f];
                label.textAlignment = NSTextAlignmentCenter;
                label.backgroundColor = [UIColor orangeColor];
                CGSize size = [self sizeOfLabel:label title:label.text];
                label.layer.masksToBounds = YES;
                NSLog(@"size = %@",NSStringFromCGSize(size));
                if (size.width + LABEL_WIDTH_ADD + startCountWith + LABEL_WIDTH_SPACE > self.frame.size.width ) {
                    startCountWith = 0;
                    startCountY = startCountY + LABEL_HEIGHT + LABEL_HEIFHT_SPACE;
                    i--;
                    continue;
                }else {
                    CGRect lFrame = CGRectMake(startCountWith + LABEL_WIDTH_SPACE, startCountY, size.width + LABEL_WIDTH_ADD, LABEL_HEIGHT);
                    label.frame = lFrame;
                    startCountWith = lFrame.origin.x + lFrame.size.width;
                }
                label.layer.cornerRadius = LABEL_HEIGHT / 2;
                [self addSubview:label];
            }
        }
    }
    if (self.type == ListLabelsView_Nomal) {
        self.listViewSize = CGSizeMake(self.frame.size.width, startCountY + LABEL_HEIGHT + LABEL_HEIFHT_SPACE);
    }else {
        self.listViewSize = CGSizeMake(self.frame.size.width, startCountY);
    }
}

- (CGSize)sizeOfLabel:(UILabel *)label title:(NSString *)labelTitle {
    return [labelTitle sizeWithAttributes:@{NSAttachmentAttributeName:[UIFont fontWithName:label.font.fontName size:label.font.pointSize]}];
}

- (CGRect)rectOfLabel:(UILabel *)label title:(NSString *)labelTitle {
    return [labelTitle boundingRectWithSize:CGSizeMake(MAIN_SCREEN_WIDTH, LABEL_HEIGHT) options:NSStringDrawingUsesFontLeading attributes:@{NSAttachmentAttributeName:[UIFont fontWithName:label.font.fontName size:label.font.pointSize]} context:nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
