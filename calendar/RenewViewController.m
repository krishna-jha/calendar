//
//  RenewViewController.m

#import "RenewViewController.h"
#import "CustomAlert.h"
#import "customoverlay.h"
@interface RenewViewController ()

@end

@implementation RenewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    customoverlay *customoverlayobj=[[customoverlay alloc]init];
    [customoverlayobj createCustomOverlay:@"" WithMessage:@"" withobject:Nil WithAction:Nil withkey:Nil withview:self.view];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
