//
//  RotatingButton.m
//  RotatingButtonAnimation
//
//  Created by David on 16/8/24.
//  Copyright © 2016年 David. All rights reserved.
//

#import "RotatingButton.h"

@interface RotatingButton ()

@property (nonatomic, assign) BOOL isFirstInit;
@property(nonatomic, assign, getter=isShow) BOOL show;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
//是否已经设置frame
@property (nonatomic, assign) BOOL hasFrame;

@end

@implementation RotatingButton

- (instancetype)init {
    self = [super init];
    if (self) {
        NSAssert(NO, @"Please Use func(initWithFrame:) or func(initWithCoder:) to init");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _hasFrame = YES;
        _isFirstInit = YES;
        [self setupRotaingButton];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _isFirstInit = YES;
        [self setupRotaingButton];
    }
    return self;
}

- (void)setupRotaingButton {
    [self.layer removeAllAnimations];
    
    if (self.isFirstInit) {
        [self configRotatingButtonFrame];
        
        self.show = !self.isShow;
        self.isFirstInit = !self.isFirstInit;
        [self setImage:self.normalImage forState:UIControlStateNormal];
        return;
    }
    
    if (self.isShow) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformRotate(self.transform, M_1_PI * 5);
            
        } completion:^(BOOL finished) {
            [self setImage:self.selectedImage forState:UIControlStateNormal];
        }];
    } else {
        [self setImage:self.normalImage forState:UIControlStateNormal];
        [UIView animateWithDuration:0.2 animations:^{
            self.transform = CGAffineTransformRotate(self.transform, -M_1_PI * 6);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                self.transform = CGAffineTransformRotate(self.transform, M_1_PI );
            }];
        }];
    }
    self.show = !self.isShow;
}

- (void)setNormalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self.normalImage = image;
    self.selectedImage = selectedImage;
    self.isFirstInit = YES;
    [self setupRotaingButton];
}

- (void)configRotatingButtonFrame {
    if (self.hasFrame) {
        return;
    }
    
    CGSize noarmalSize = self.normalImage.size;
    CGSize selectedSize = self.selectedImage.size;
    CGFloat w = noarmalSize.width > selectedSize.width ? noarmalSize.width : selectedSize.width;
    CGFloat h = noarmalSize.height > selectedSize.height ? noarmalSize.height : selectedSize.height;
    self.bounds = CGRectMake(0, 0, w, h);
}

- (UIImage *)normalImage {
    if (!_normalImage) {
        _normalImage = [UIImage imageNamed:@"normal.png"];
    }
    return _normalImage;
}

- (UIImage *)selectedImage {
    if (!_selectedImage) {
        _selectedImage = [UIImage imageNamed:@"cancel.png"];
    }
    return _selectedImage;
}

#pragma mark - Action

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setupRotaingButton];
    NSLog(@"touch Begin");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    NSLog(@"touch end");
}

//- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
//    [super sendAction:@selector(transferAction) to:target forEvent:event];
//}
//
//- (void)transferAction {
//    NSLog(@"transferAction");
//}

@end
