//
//  customoverlay.m
/*
 * Copyright (c) Lukup Media Pvt Limited, India.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of Lukup Media Pvt Limited ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms
 * of the licence agreement you entered into with Lukup Media Pvt Limited.
 *
 */

#import "customoverlay.h"

static UIView *overlayview;
@implementation customoverlay
-(void) createCustomOverlay:(NSString*)Title WithMessage:(NSString*)message withobject:(id)Object WithAction:(NSString*)action withkey:(NSString*)key withview:(UIView*)view

{
	@try {
		
		
		shieldView = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 310, 380)];
		shieldView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
		kayvalue=key;
		MainScreen= [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 380)];//CGRectMake(20, 130, 280, 172)];
		MainScreen.center = shieldView.center;
		//set background
		UIImage *alertBoxImage = [UIImage imageNamed:@"overlay_bg.png"];
		UIImageView *_backgroundImageView = [[UIImageView alloc] initWithImage:alertBoxImage];
		_backgroundImageView.frame = CGRectMake(0, 0, 280, 320);//CGRectMake(0, 0, 280, 172);
		_backgroundImageView.contentMode = UIViewContentModeScaleToFill;
		[MainScreen addSubview:_backgroundImageView];
		[shieldView addSubview:MainScreen];
//		 [[[[UIApplication sharedApplication] windows] lastObject] addSubview:shieldView];
        [view addSubview:shieldView];
		
		//Add title label....
				//add button to warningalert
		//Button
		UIButton *Cancel = [UIButton buttonWithType:UIButtonTypeCustom];
		[Cancel addTarget:self action:@selector(hide)forControlEvents:UIControlEventTouchDown];
        
		Cancel.frame =CGRectMake(0, 10, 240, 40);//[bounds setbounds:0 withycoors:133 withWidth:139 withHeight:40]; //CGRectMake(0.0, 133, 139, 40.0);
		Cancel.tag=1;
        [Cancel setTitle:@"close" forState:UIControlStateNormal];
		[MainScreen addSubview:Cancel];	
		//[self initialDelayEnded];
			
		//Animationclass *obj5=[[Animationclass alloc]init];
		//[obj5 attachPopUpAnimation:MainScreen];
	}
	@catch (NSException *exception) {
		NSLog(@"Overlay=%@:",[exception reason]);
	}
	
	
	
}
//TextField delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	// NSLog(@"textFieldShouldReturn:");
	[textField resignFirstResponder];
	 //CGRectMake(MainScreen.frame.origin.x, (110 +20.0), MainScreen.frame.size.width, MainScreen.frame.size.height);
    if (textField.tag == 1) {
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	// NSLog(@"textFieldDidBeginEditing");
	if([textField tag]==1)
	{
		//BoundCalculation *bounds=[[BoundCalculation alloc] init];
		//CGRect FrameSize=	[bounds setbounds:MainScreen.frame.origin.x withycoors: (110 -20.0) withWidth:MainScreen.frame.size.width withHeight:MainScreen.frame.size.height];
		//MainScreen.frame =FrameSize;
		MainScreen.frame = CGRectMake(MainScreen.frame.origin.x, (110 - 20.0), MainScreen.frame.size.width, MainScreen.frame.size.height);
	} 
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
	// NSLog(@"textFieldDidEndEditing");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
	// NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    if ([string isEqualToString:@"#"]) {
        return NO;
    }
    else {
        return YES;
    }
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
	// NSLog(@"textFieldShouldClear:");
    return YES;
}
-(void)hide
{
    [MainScreen removeFromSuperview];
    [shieldView removeFromSuperview];
}
// Button Action 

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
	@try {
		
		BOOL stricterFilter = YES;
		NSString *stricterFilterString = @"[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
		NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
		NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
		NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
		return [emailTest evaluateWithObject:checkString];
	}
	@catch (NSException *exception) {
		
	}
	
	
}	
-(void)initialDelayEnded {
    MainScreen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    self.view.alpha = 1.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.1/1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
    MainScreen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    [UIView commitAnimations];
}

- (void)bounce1AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.1/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
   MainScreen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.1/2];
    MainScreen.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}
@end
