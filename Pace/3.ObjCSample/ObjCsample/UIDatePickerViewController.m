//
//  UIDatePickerViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 12/2/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "UIDatePickerViewController.h"

@interface UIDatePickerViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *objDatePickerView;
- (IBAction)btnBack_Click:(UIButton *)sender;

@end

@implementation UIDatePickerViewController

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

- (UIDatePicker *) objDatePickerView
{
    if (!_objDatePickerView) {
        _objDatePickerView = [[UIDatePicker alloc] init];
    }
    return _objDatePickerView;
}

- (IBAction)btnBack_Click:(UIButton *)sender
{
    NSLog(@"DateTime Chosen: %@", [self.objDatePickerView date]);
    [self dismissViewControllerAnimated:TRUE completion:nil];
}



@end
