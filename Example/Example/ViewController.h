//
//  ViewController.h
//  Example
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

#import <JT3DScrollView.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet JT3DScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftNextButtonConstraint;

@end

