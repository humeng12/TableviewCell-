

#import <UIKit/UIKit.h>
@class MJStatusFrame;

@interface MJStatusCell : UITableViewCell
@property (nonatomic, strong) MJStatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
