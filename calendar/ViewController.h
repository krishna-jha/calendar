//
//  ViewController.h
#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate,CustomIOS7AlertViewDelegate>
{
    BOOL selection[100];
    UILabel *lbl2 ;
    UILabel *lbl1;
    UILabel *lbl3;
    NSArray *tableData;
    NSArray *tableData2;
    NSArray *tableData3;
}
- (IBAction)renew:(id)sender;
- (IBAction)filter:(id)sender;

@end
