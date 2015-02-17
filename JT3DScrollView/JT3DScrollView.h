//
//  JT3DScrollView.h
//  JT3DScrollView
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JT3DScrollViewEffect) {
    JT3DScrollViewEffectNone,
    JT3DScrollViewEffectTranslation,
    JT3DScrollViewEffectDepth,
    JT3DScrollViewEffectCarousel,
    JT3DScrollViewEffectCards
};

@interface JT3DScrollView : UIScrollView

@property (nonatomic) JT3DScrollViewEffect effect;

@property (nonatomic) CGFloat angleRatio;

@property (nonatomic) CGFloat rotationX;
@property (nonatomic) CGFloat rotationY;
@property (nonatomic) CGFloat rotationZ;

@property (nonatomic) CGFloat translateX;
@property (nonatomic) CGFloat translateY;

- (NSUInteger)currentPage;

- (void)loadNextPage:(BOOL)animated;
- (void)loadPreviousPage:(BOOL)animated;
- (void)loadPageIndex:(NSUInteger)index animated:(BOOL)animated;

@end
