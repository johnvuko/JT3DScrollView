//
//  JT3DScrollView.m
//  JT3DScrollView
//
//  Created by Jonathan Tribouharet
//

#import "JT3DScrollView.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation JT3DScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    self.pagingEnabled = YES;
    self.clipsToBounds = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    [self setPreset:JT3DScrollViewNone];
}

// faire une enum avec des configuration d effet par defaut, preset
// faire un effet exposition, quand on click les views s ecartent!

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat contentOffsetX = self.contentOffset.x;
    CGFloat contentOffsetY = self.contentOffset.y;
    
    for(UIView *view in self.subviews){
        view.layer.transform = CATransform3DIdentity;
        
        CGFloat distanceFromCenterX = view.frame.origin.x - contentOffsetX;
        CGFloat distanceFromCenterY = view.frame.origin.y - contentOffsetY;

        distanceFromCenterX = distanceFromCenterX / CGRectGetWidth(self.frame) * 100.;
        distanceFromCenterY = distanceFromCenterY / CGRectGetHeight(self.frame) * 100.;
        
        CGFloat angle = distanceFromCenterX / 2.;

        // rotation around axe x and y
        CATransform3D t = CATransform3DMakeRotation(DEGREES_TO_RADIANS(angle), - 1., - 1., 0.);

        // 1 ajoute un espace entre chaque view
        // 2 hauteur
        // SCREEN_WIDTH * .3 a cause de la rotation et du decalage de SCREEN_WIDTH * .1
        CGFloat offset = distanceFromCenterX;
        view.layer.transform = CATransform3DTranslate(t, (SCREEN_WIDTH * .3) * offset / 100., fabs(offset) + distanceFromCenterY / 5., 0.);
    }
}

- (void)setPreset:(JT3DScrollViewPreset)preset
{
    switch (preset) {
        case JT3DScrollViewNone:
            break;
    }
}

- (void)loadFirstPage
{
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    [self scrollRectToVisible:frame animated:NO];
}

- (void)loadNextPage
{
    CGRect frame = self.frame;
    frame.origin.x = frame.size.width * ([self currentPage] + 1);
    frame.origin.y = 0;
    [self scrollRectToVisible:frame animated:YES];
}

- (void)loadPreviousPage
{
    CGRect frame = self.frame;
    frame.origin.x = frame.size.width * ([self currentPage] - 1);
    frame.origin.y = 0;
    [self scrollRectToVisible:frame animated:YES];
}

- (NSUInteger)currentPage
{
    CGFloat pageWidth = self.frame.size.width;
    float fractionalPage = self.contentOffset.x / pageWidth;
    return lround(fractionalPage);
}

@end
