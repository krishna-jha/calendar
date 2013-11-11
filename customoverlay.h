//
//  customoverlay.h
/*
 * Copyright (c) Lukup Media Pvt Limited, India.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of Lukup Media Pvt Limited ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms
 * of the licence agreement you entered into with Lukup Media Pvt Limited.
 *
 */


@interface customoverlay : UIViewController<UITextFieldDelegate>
{
	id Objectdata;
	UIAlertView *warningalert;
	NSString *messagedata;
	NSString *titledata;
	NSString *kayvalue;
	UITextField	*Name;
		UIView *MainScreen;
	UIView *shieldView;
	id Actiondata;
	//UIButton *Cancel;
	//UIButton *OK;
}
//-(void) createOverlay:(NSString*)Title WithMessage:(NSString*)message withobject:(id)Object WithAction:(NSString*)action withkey:(NSString*)key;
-(void) createCustomOverlay:(NSString*)Title WithMessage:(NSString*)message withobject:(id)Object WithAction:(NSString*)action withkey:(NSString*)key withview:(UIView*)view;
//-(void) SetGradiant:(UIButton*)sender;

@end
