

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MJStatus;

@interface MJStatusFrame : NSObject
/**
 *  头像的frame
 */
@property (nonatomic, assign, readonly) CGRect iconF;
/**
 *  昵称的frame
 */
@property (nonatomic, assign, readonly) CGRect nameF;
/**
 *  会员图标的frame
 */
@property (nonatomic, assign, readonly) CGRect vipF;
/**
 *  正文的frame
 */
@property (nonatomic, assign, readonly) CGRect textF;
/**
 *  配图的frame
 */
@property (nonatomic, assign, readonly) CGRect pictureF;

/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) MJStatus *status;
@end
