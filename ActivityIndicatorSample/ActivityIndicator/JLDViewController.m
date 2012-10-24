//
//    JLDViewController.h
//    ActivityIndicator
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

#import "JLDViewController.h"
#import "JLDActivityIndicatorView.h"


@interface JLDViewController ()

@property (nonatomic, strong) JLDActivityIndicatorView *toggleIndicatorView;

@end



@implementation JLDViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [_nibIndicatorView showInView:_nibIndicatorView.superview];
    [_tintIndicatorView showInView:_tintIndicatorView.superview];
    
    JLDActivityIndicatorView *hud1 = [JLDActivityIndicatorView activityIndicatorView];
    [hud1 showInView:_indicator1ContainerView];
    
    JLDActivityIndicatorView *hud2 = [JLDActivityIndicatorView activityIndicatorView];
    [hud2 setTintColor:[UIColor colorWithRed:1.f green:0.1569f blue:0.f alpha:1]];
    [hud2 setShadowTintColor:[UIColor colorWithRed:0.3f green:0 blue:0 alpha:1]];
    [hud2 setActivityTintColor:[UIColor yellowColor]];
    [hud2 showInView:_indicator2ContainerView];
    
}

- (void)showIndicator:(id)sender {
    
    if (!_toggleIndicatorView) {
        self.toggleIndicatorView = [JLDActivityIndicatorView activityIndicatorView];
    }
    
    [_toggleIndicatorView showInView:_indicator3ContainerView];
}

- (void)hideIndicator:(id)sender {
    
    [_toggleIndicatorView hide];
    
}

- (void)changeIndicatorTint:(id)sender {
    
    [_tintIndicatorView setTintColor:[UIColor colorWithRed:(arc4random() % 256) / 255.f
                                                     green:(arc4random() % 256) / 255.f
                                                      blue:(arc4random() % 256) / 255.f
                                                     alpha:1.f]
                            animated:YES];
    
}


@end
