//
//  ViewController.m
//  Example
//
//  Created by Jonathan Tribouharet
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.scrollView.effect = JT3DScrollViewEffectCards;
    
    self.scrollView.delegate = self; // Use only for animate nextButton and previousButton
    
    [self createCardWithColor:[UIColor orangeColor]];
    [self createCardWithColor:[UIColor orangeColor]];
    [self createCardWithColor:[UIColor orangeColor]];
    [self createCardWithColor:[UIColor orangeColor]];
    
    self.nextButton.layer.cornerRadius = 3.;
    self.previousButton.layer.cornerRadius = 3.;
}

- (void)createCardWithColor:(UIColor *)color
{
    CGFloat width = CGRectGetWidth(self.scrollView.frame);
    CGFloat height = CGRectGetHeight(self.scrollView.frame);
 
    CGFloat x = self.scrollView.subviews.count * width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, 0, width, height)];
    view.backgroundColor = color;
    
    view.layer.cornerRadius = 3.;
    
    [self.scrollView addSubview:view];
    self.scrollView.contentSize = CGSizeMake(x + width, height);
}

- (IBAction)loadNextPage:(id)sender
{
    [self.scrollView loadNextPage:YES];
}

- (IBAction)loadPreviousPage:(id)sender
{
    [self.scrollView loadPreviousPage:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateButtons];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateButtons];
}

- (void)updateButtons
{
    if(self.scrollView.currentPage >= self.scrollView.subviews.count - 1){
        [self showPreviousButton];
    }
    else{
        [self showNextButton];
    }
}

- (void)showNextButton
{
    [UIView animateWithDuration:.3
                     animations:^{
                         self.leftNextButtonConstraint.constant = 20;
                         [self.view layoutIfNeeded];
                     }];
}

- (void)showPreviousButton
{
    [UIView animateWithDuration:.3
                     animations:^{
                         self.leftNextButtonConstraint.constant = - CGRectGetWidth(self.view.frame);
                         [self.view layoutIfNeeded];
                     }];
}

@end
