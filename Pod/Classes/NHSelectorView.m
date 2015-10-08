//
//  NHSelectorView.m
//  Pods
//
//  Created by Sergey Minakov on 08.10.15.
//
//

#import "NHSelectorView.h"

#define kNHSelectorDefaultFont \
[UIFont systemFontOfSize:17]

#define kNHSelectorDefaultNormalColor \
[UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1]

#define kNHSelectorDefaultSelectedColor \
[UIColor colorWithRed:1 green:1 blue:1 alpha:1]

@interface NHSelectorView ()

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray<UIButton *> *buttonArray;

@property (nonatomic, strong) NSMutableDictionary *buttonProperties;

@property (nonatomic, strong) UIView *selectionView;
@property (nonatomic, strong) UIView *separatorView;

@end

@implementation NHSelectorView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self nhCommonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self nhCommonInit];
    }
    
    return self;
}

- (void)dealloc {
    [self removeFromSuperview];
    [self clearButtonArray];
    self.buttonProperties = nil;
}

- (void)nhCommonInit {
    self.font = kNHSelectorDefaultFont;
    self.buttonProperties[@(UIControlStateNormal)] = kNHSelectorDefaultNormalColor;
    self.buttonProperties[@(UIControlStateSelected)] = kNHSelectorDefaultSelectedColor;
}

- (void)clearButtonArray {
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    self.buttonArray = nil;
}

- (void)setItems:(nullable NSArray *)items {
    
    [self clearButtonArray];
    //check for image and string
    [self recreateButtonArray];
}

- (void)recreateButtonArray {
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    
}

- (void)setColor:(UIColor *)color forState:(UIControlState)state {
    if (color) {
        self.buttonProperties[@(state)] = color;
    }
    else {
        switch (state) {
            case UIControlStateNormal:
                self.buttonProperties[@(state)] = kNHSelectorDefaultNormalColor;
                break;
            case UIControlStateSelected:
                self.buttonProperties[@(state)] = kNHSelectorDefaultSelectedColor;
                break;
            default:
                [self.buttonProperties removeObjectForKey:@(state)];
                break;
        }
    }
    
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        [obj setTitleColor:self.buttonProperties[@(state)]
                  forState:state];
    }];
}

- (void)setFont:(UIFont *)font {
    [self willChangeValueForKey:@"font"];
    if (font) {
        _font = font;
    }
    else {
        _font = kNHSelectorDefaultFont;
    }
    
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        obj.titleLabel.font = _font;
    }];
    [self didChangeValueForKey:@"font"];
}

@end
