//
//  PickerViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 11/21/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *objPickerView;

- (IBAction)btnBack_Click:(id)sender;

@end

@implementation PickerViewController

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
    self.objPickerView.delegate = self;
    self.objPickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Click:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (UIPickerView *) objPickerView
{
    if (!_objPickerView) {
        _objPickerView = [[UIPickerView alloc] init];
    }
    return _objPickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return @"Red";
}

- (void) setPickerView
{
//    UIPickerView *picker = [[UIPickerView alloc] init];
//    UIPickerViewDataSource *data = [UIPic]
}

@end
