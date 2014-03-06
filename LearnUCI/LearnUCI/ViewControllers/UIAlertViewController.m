//
//  UIAlertViewController.m
//  LearnUCI
//
//  Created by Richard Lee on 3/6/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "UIAlertViewController.h"

@interface UIAlertViewController ()
@end

@implementation UIAlertViewController

//static int TOUR_DONE_ALERT = 0;
//static int NEXT_POINT_ALERT = 1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if (alertView.tag == 0) {
        if([title isEqualToString:@"Ok"])
        {
            //do nothing
        }
        else
        {
            [self.caller getAndSetNextAnnotation];
        }
    }
    else if(alertView.tag == 1)
    {
        if([title isEqualToString:@"Close Map"])
        {
            [self.caller.navigationController popViewControllerAnimated:YES];
        }
        else if([title isEqualToString:@"Return to Map"])
        {
            //do nothing
        }
    }
}
@end
