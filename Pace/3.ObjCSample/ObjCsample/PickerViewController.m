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
//    self.arrComponent0 = [[NSArray alloc] initWithObjects:@"Male", @"Female", nil];
//    self.arrComponent1 = [[NSArray alloc] initWithObjects:@"Red", @"Blue", @"Green", @"Yellow", nil];
    self.arrComponent0 = [[NSMutableArray alloc] init];
    [self.arrComponent0 addObject:@"Male"];
    [self.arrComponent0 addObject:@"Female"];
    
    self.arrComponent1 = [[NSMutableArray alloc] initWithObjects:@"Red", @"Blue", @"Green", @"Yellow", nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (self.name) {
        [self.arrComponent0 addObject:self.name];
    }
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
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    /*
    if (component == 0) {
        return 2;
    } else {
        return 5;
    }
     */
    if (component == 0) {
        return [self.arrComponent0 count];
        NSLog(@"Count = %i", [self.arrComponent0 count]);
    } else {
        return [self.arrComponent1 count];
        NSLog(@"Count = %i", [self.arrComponent1 count]);
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    NSString *componentText = @"";
    /*
    NSDictionary *colors = @{@(0) : @"Red",
                             @(1) : @"Blue",
                             @(2) : @"Green",
                             @(3) : @"Yellow",
                             @(4) : @"Black",
                             @(5) : @"Purple"};
    
    if (component == 0) {
        if (row == 0) {
            return @"Male";
        } else {
            return @"Female";
        }
//        NSLog([NSString stringWithFormat:@"Component %i", row]);
    }else {
        return componentText = [colors objectForKey:@(row)];
    }
    
    
    return componentText;
     */
    
    if (component == 0) {
        return componentText = [self.arrComponent0 objectAtIndex:row];
    } else {
        return componentText = [self.arrComponent1 objectAtIndex:row];
    }
}

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 100;
    } else {
        return 150;
    }
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100;
}

- (void) pickerView:(UIPickerView *)pickerView
       didSelectRow:(NSInteger)row
        inComponent:(NSInteger)component
{
    if (component == 0) {
        NSLog(@"%@", [self.arrComponent0 objectAtIndex:row]);
    } else {
        NSLog(@"%@", [self.arrComponent1 objectAtIndex:row]);
    }
}

- (UIView *) pickerView:(UIPickerView *)pickerView
             viewForRow:(NSInteger)row
           forComponent:(NSInteger)component
            reusingView:(UIView *)view
{
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.jpg"]];
    
//    return imgView;
    
    UILabel *objLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 200)];
    
    if (component == 0) {
        objLabel.text = [self.arrComponent0 objectAtIndex:row];
//        objLabel.textColor = [UIColor redColor];
    } else {
        objLabel.text = [self.arrComponent1 objectAtIndex:row];
        if ([[self.arrComponent1 objectAtIndex:row] isEqualToString:@"Red"]) {
            NSLog(@"%@",[self.arrComponent1 objectAtIndex:row]);
            objLabel.textColor = [UIColor redColor];
        }
        objLabel.textColor = [UIColor greenColor];
    }
    
    objLabel.adjustsFontSizeToFitWidth = YES;
    objLabel.font = [UIFont systemFontOfSize:100];
    return objLabel;
    
}

@end
