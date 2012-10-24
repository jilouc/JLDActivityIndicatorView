//
//    JLDActivityIndicatorView
//
//    Copyright (c) 2012 Jean-Luc Dagon (http://jldagon.me)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.
//

#import "JLDActivityIndicatorView.h"
#import <QuartzCore/QuartzCore.h>

@interface JLDActivityIndicatorView ()

@property (nonatomic, retain) UIActivityIndicatorView *loadingIndicator;

@end

@implementation JLDActivityIndicatorView

+ (JLDActivityIndicatorView *)activityIndicatorView {
    return [[JLDActivityIndicatorView alloc] initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:CGRectMake(0, 0, 44, 44)];
    if (self) {
        [self _configure];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _configure];
    }
    return self;
}

- (void)_configure {
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    self.layer.cornerRadius = 8;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeZero;
    
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _loadingIndicator.center = CGPointMake(22, 22);
    
    [self addSubview:_loadingIndicator];
}

- (void)setTintColor:(UIColor *)tintColor {
    [self setTintColor:tintColor animated:NO];
}

- (void)setTintColor:(UIColor *)tintColor animated:(BOOL)animated {

    [UIView animateWithDuration:animated ? 0.2f : 0.f animations:^{
        self.backgroundColor = [tintColor colorWithAlphaComponent:0.7f];
    }];
}

- (void)setShadowTintColor:(UIColor *)tintColor {
    self.layer.shadowColor = tintColor.CGColor;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
- (void)setActivityTintColor:(UIColor *)tintColor {
    [self.loadingIndicator setColor:tintColor];
}
#endif

- (void)showInView:(UIView *)v {
    
    self.alpha = 0;
    [v addSubview:self];
    
    self.transform = CGAffineTransformIdentity;
    
    self.frame = CGRectMake(0, 0, 44, 44);
    self.center = CGPointMake(CGRectGetWidth(v.frame) / 2, CGRectGetHeight(v.frame) / 2);
    
    self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    [_loadingIndicator startAnimating];
    
    [UIView animateWithDuration:0.2f animations:^{
        self.alpha = 1.f;
        self.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)hide {
    [self hideAfter:0.f];
}

- (void)hideAfter:(NSTimeInterval)delay {
    
    [UIView animateWithDuration:0.2f delay:delay options:UIViewAnimationCurveEaseInOut animations:^{
        self.alpha = 0.f;
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        [_loadingIndicator stopAnimating];
        [self removeFromSuperview];
        self.transform = CGAffineTransformIdentity;
    }];
}

@end
