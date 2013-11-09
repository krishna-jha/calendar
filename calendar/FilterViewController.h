//
//  FilterViewController.h

//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController<UITableViewDataSource,UISearchBarDelegate>
{
}
    @property (nonatomic, weak) IBOutlet UISearchBar *searchedBar;
    @property (nonatomic, strong) NSString *mainTitle;
    @property (nonatomic, strong) NSString *subTitle;
    @property (nonatomic, strong) NSMutableArray *searchResults;
    @property (nonatomic, assign) BOOL shouldReloadOnAppear;
@end


