//
//  ViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "ViewController.h"
#import "PickerViewController.h"

@interface ViewController ()
@property (nonatomic, strong) ArithmeticOperations *objArithmeticOperation;
@property (strong, nonatomic) IBOutlet UITextField *txtValue1;
@property (strong, nonatomic) IBOutlet UITextField *txtValue2;
@property (weak, nonatomic) IBOutlet UIButton *AddButton;
@property (weak, nonatomic) IBOutlet UIButton *SubtractButton;

@property (strong, nonatomic) IBOutlet UILabel *lblResult;
//- (IBAction)btnAdd_Click:(id)sender;
//- (IBAction)btnSub_Click:(id)sender;
- (IBAction)btnPerformArithmetic:(id)sender;
- (IBAction)showAlert:(UIButton *)sender;
- (IBAction)btnPickerView:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self testHarness];
//    [self looping];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ArithmeticOperations *) objArithmeticOperation
{
    if (!_objArithmeticOperation) {
        _objArithmeticOperation = [[ArithmeticOperations alloc] init];
    }
    
    return _objArithmeticOperation;
}

- (IBAction)btnPerformArithmetic:(UIButton *)sender
{
    //check txtVal1 and txtVal2 for values
    if (self.txtValue1.text.length > 0
        && self.txtValue2.text.length > 0) {
        
        self.objArithmeticOperation.intValue1 = [self.txtValue1.text floatValue];
        self.objArithmeticOperation.intValue2 = [self.txtValue2.text floatValue];
        
        NSString *resultmsg = [[NSString alloc] init];
        
        if ([sender isEqual:self.AddButton]) {
            resultmsg = [NSString stringWithFormat:@"Result: %.4f", [self.objArithmeticOperation Add]];
        } else if ([sender isEqual:self.SubtractButton]){
            resultmsg = [NSString stringWithFormat:@"Result: %.4f", [self.objArithmeticOperation Sub]];
        }
        
        self.lblResult.text = resultmsg;
    }
    else if (!self.txtValue1.text.length > 0
             || !self.txtValue2.text.length > 0)
    {
        self.lblResult.text = @"Please enter both values";
    }

}

- (IBAction)showAlert:(UIButton *)sender
{
//    [self callAlertView];
    [self callActionSheet];
}



- (void) callAlertView
{
    UIAlertView *objAlertView = [[UIAlertView alloc] initWithTitle:@"Obj C Sample"
                                                           message:@" This is a test message"
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"Button1", @"Button2", @"Button3", @"Button4", @"Button5", @"Button6", nil];
    
    [objAlertView show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clicked button at index %i", buttonIndex);
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Button5"]) {
        NSLog(@"Pressed Button5");
    }
//    [alertView buttonTitleAtIndex:buttonIndex] ;
}

- (void) callActionSheet
{
    UIActionSheet *objActionSheet = [[UIActionSheet alloc] initWithTitle:@"Obj C Sample"
                                                                delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                  destructiveButtonTitle:@"Delete"
                                                       otherButtonTitles:@"Button1", @"Button2", @"Button3",nil];
    [objActionSheet showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clicked button at index %i", buttonIndex);
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Delete"]) {
        NSLog(@"You deleted");
    }
}

- (IBAction)btnPickerView:(UIButton *)sender
{
    //This is the way to goto another screen using XIB.
    /*
    PickerViewController *objPickerViewController = [[PickerViewController alloc] init];
    [self presentViewController:objPickerViewController
                       animated:TRUE
                     completion:nil];
     */
    
    //This is the way to goto another screen using StoryBoard files.
    UIStoryboard *objStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PickerViewController *objPickerViewController = [objStoryBoard instantiateViewControllerWithIdentifier:@"PickerViewController"];
    [self presentViewController:objPickerViewController
                       animated:TRUE
                     completion:nil];
}

@end
