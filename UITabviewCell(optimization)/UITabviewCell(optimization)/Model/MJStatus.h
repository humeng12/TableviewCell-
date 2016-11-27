

#import <Foundation/Foundation.h>

@interface MJStatus : NSObject
@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, copy) NSString *picture; // 配图
@property (nonatomic, assign) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusWithDict:(NSDictionary *)dict;
@end
