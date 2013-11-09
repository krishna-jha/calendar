//
//  ViewController.m


#import "ViewController.h"
#import "FilterViewController.h"
#import "RenewViewController.h"
#import "TransferViewController.h"
#import "CustomIOS7AlertView.h"
#import "CKCalendarView.h"
@interface ViewController () <CKCalendarDelegate>

@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSArray *disabledDates;

@end

@implementation ViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title =@" my project ";
    UIBarButtonItem *Filter = [[UIBarButtonItem alloc] initWithTitle:@"Filter"
                                                               style:UIBarButtonItemStyleBordered target:self action:@selector(filter:)];
    UIBarButtonItem *Renew = [[UIBarButtonItem alloc] initWithTitle:@"Renew"
                                                                    style:UIBarButtonItemStyleBordered target:self action:@selector(renew:)];
    
    [[self navigationItem] setRightBarButtonItem:Filter];
    [[self navigationItem] setLeftBarButtonItem:Renew];
    tableData = [NSArray arrayWithObjects:@"Andy",@"Bob",@"Catherine",@"Dude",@"Elan",@"Fantastic",@"Goody",@"Helen",@"Ivi",@"Jockey",@"Kelly",@"Luci",@"Maggy",@"Naren",@"Ooo",@"Pint", nil];
    
    tableData2 = [NSArray arrayWithObjects:@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25", nil];
    
    tableData3 = [NSArray arrayWithObjects:@"1110",@"1111",@"1112",@"1113",@"2214",@"2215",@"2216",@"3317",@"3318",@"3319",@"3320",@"4421",@"4422",@"4423",@"5524",@"6625", nil];
   
}

/*
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Did Receive Response %@", response);
    responseData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    //NSLog(@"Did Receive Data %@", data);
    [responseData appendData:data];
}
- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    NSLog(@"Did Fail");
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Did Finish");
    // Do something with responseData
}


*/



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        //first label
        //Initialize Label
        lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, cell.contentView.frame.size.width-20, 20)];
        [lbl1 setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        [lbl1 setTextColor:[UIColor grayColor]];
        lbl1.tag=1;
        [cell addSubview:lbl1];
        
        //second label
       lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 5, cell.contentView.frame.size.width-20, 20)];
        [lbl2 setFont:[UIFont fontWithName:@"FontName" size:12.0]];
        [lbl2 setTextColor:[UIColor blackColor]];
        lbl2.tag=2l;
        [cell addSubview:lbl2];
        
       lbl3 = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, cell.contentView.frame.size.width-20, 20)];
        [lbl3 setFont:[UIFont fontWithName:@"FontName" size:6.0]];
        [lbl3 setTextColor:[UIColor blueColor]];
        lbl3.tag=3;
        [cell addSubview:lbl3];  
             
    }
    
    lbl1=(UILabel*)[cell viewWithTag:1];
    lbl1.text=[tableData objectAtIndex:indexPath.row];
    lbl2=(UILabel*)[cell viewWithTag:2];
    lbl2.text=[tableData2 objectAtIndex:indexPath.row];
    lbl3=(UILabel*)[cell viewWithTag:3];
    lbl3.text=[tableData3 objectAtIndex:indexPath.row];
    
    if(selection[indexPath.row])
    {
        lbl1.frame=CGRectMake(100, 5, 100, 20);
        //lbl1.numberOfLines=0;
        lbl1.lineBreakMode = UILineBreakModeTailTruncation;
        lbl1.transform=CGAffineTransformMakeRotation(-M_PI/2);
        //Add button....
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                   action:@selector(LeaveDate:)
         forControlEvents:UIControlEventTouchDown];
        [button setTitle:@"Leave Date" forState:UIControlStateNormal];
        button.frame = CGRectMake(80.0, 50.0, 100.0, 40.0);
        [cell.contentView addSubview:button];
        
        
        
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(selection[indexPath.row])
    {
        return 100;
        
    }
    else
    {
        
    return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
   if(!selection[indexPath.row])
   {
    selection[indexPath.row]=YES;
       for (int i=0; i<[tableData count]; i++)
       {
           if(i!=indexPath.row)
           selection[i]=NO;
           
       }

   }
    else
    {
     selection[indexPath.row]=NO;
        
    }

    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    
}

//NSInteger rowIndex = indexPath.row;


- (IBAction)renew:(id)sender {
    
    NSLog(@"renew clicked");
    
    RenewViewController *renewobj=[[RenewViewController alloc]initWithNibName:@"RenewViewController" bundle:Nil];
    [self.navigationController pushViewController:renewobj animated:YES];
        
    }

- (IBAction)filter:(id)sender

{
    FilterViewController *Filterobj=[[FilterViewController alloc]initWithNibName:@"FilterViewController" bundle:Nil];
    [self.navigationController pushViewController:Filterobj animated:YES];
}
-(void)LeaveDate:(id)sender
{
    // Here we need to pass a full frame
    CustomIOS7AlertView *alertView = [[CustomIOS7AlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", @"Close2", @"Close3", nil]];
    [alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
    //Calendar display
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = self;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.minimumDate = [self.dateFormatter dateFromString:@"20/09/2012"];
    
    self.disabledDates = @[
                           [self.dateFormatter dateFromString:@"05/01/2013"],
                           [self.dateFormatter dateFromString:@"06/01/2013"],
                           [self.dateFormatter dateFromString:@"07/01/2013"]
                           ];
    
    calendar.onlyShowCurrentMonth = NO;
    calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    
    calendar.frame = CGRectMake(10, 50, 300, 276);
    [alertView addSubview:calendar];
    
//    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
//    [self.view addSubview:self.dateLabel];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
    [alertView close];
}

- (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 320)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 300)];
    [imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    return demoView;
}
- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}

- (BOOL)dateIsDisabled:(NSDate *)date {
    for (NSDate *disabledDate in self.disabledDates) {
        if ([disabledDate isEqualToDate:date]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark -
#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date {
    // TODO: play with the coloring if we want to...
    if ([self dateIsDisabled:date]) {
        dateItem.backgroundColor = [UIColor redColor];
        dateItem.textColor = [UIColor whiteColor];
    }
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date {
    return ![self dateIsDisabled:date];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    self.dateLabel.text = [self.dateFormatter stringFromDate:date];
}

- (BOOL)calendar:(CKCalendarView *)calendar willChangeToMonth:(NSDate *)date {
    if ([date laterDate:self.minimumDate] == date) {
        self.calendar.backgroundColor = [UIColor blueColor];
        return YES;
    } else {
        self.calendar.backgroundColor = [UIColor redColor];
        return NO;
    }
}

- (void)calendar:(CKCalendarView *)calendar didLayoutInRect:(CGRect)frame {
    NSLog(@"calendar layout: %@", NSStringFromCGRect(frame));
}


@end
