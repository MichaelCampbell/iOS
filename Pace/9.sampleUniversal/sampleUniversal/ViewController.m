//
//  ViewController.m
//  sampleUniversal
//
//  Created by Michael Campbell on 2/25/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.lblTitle.text = @"Sample Universal";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender
{
//    UIAlertView *alertView;
    UIStoryboard *storyBoard;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
//        alertView = [[UIAlertView alloc] initWithTitle:@"From iPhone"
//                                               message:@""
//                                              delegate:self
//                                     cancelButtonTitle:@"Cancel"
//                                     otherButtonTitles:nil];
        
        storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                               bundle:nil];
        
    }
    else
    {
//        alertView = [[UIAlertView alloc] initWithTitle:@"From iPad"
//                                               message:@""
//                                              delegate:self
//                                     cancelButtonTitle:@"Cancel"
//                                     otherButtonTitles:nil];
        storyBoard = [UIStoryboard storyboardWithName:@"Main_iPad"
                                               bundle:nil];
    }
    
//    [alertView show];
    SecondViewController *objSecondViewController = [storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self presentViewController:objSecondViewController
                       animated:YES
                     completion:nil];
    
}
@end
