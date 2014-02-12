//
//  CustomMPMoviePlayerViewController.m
//  mediasample
//
//  Created by Michael Campbell on 2/11/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "CustomMPMoviePlayerViewController.h"

@interface CustomMPMoviePlayerViewController ()

@end

@implementation CustomMPMoviePlayerViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

@end
