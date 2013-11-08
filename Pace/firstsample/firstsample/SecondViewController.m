//
//  SecondViewController.m
//  firstsample
//
//  Created by Michael Campbell on 11/7/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
	// Do any additional setup after loading the view.
    [self.btnGotoFirst setTitle:@"Goto First" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGotoFirst_Click:(UIButton *)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
