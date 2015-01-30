//
//  JT3DScrollView.h
//  JT3DScrollView
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JT3DScrollViewPreset) {
    JT3DScrollViewNone
};

@interface JT3DScrollView : UIScrollView

- (void)setPreset:(JT3DScrollViewPreset)preset;

- (void)loadFirstPage;
- (void)loadNextPage;
- (void)loadPreviousPage;
- (NSUInteger)currentPage;

@end
