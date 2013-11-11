//
//  AboutsettingScreen.h
/*
 * Copyright (c) Lukup Media Pvt Limited, India.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of Lukup Media Pvt Limited ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms
 * of the licence agreement you entered into with Lukup Media Pvt Limited.
 *
 */

@interface AboutsettingScreen : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
	NSMutableArray *arrayNo;
	UITableView *myBeaconsTableView;
	UIView *contentView;
	int selectedRowCount;
	NSMutableArray *textArray;
}

-(void)CreateList:(UIView*)aview withdata:(NSArray*) data withHeader:(NSArray*)headerdata;

@end
