//
//  ViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "ViewController.h"

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

- (void) testHarness
{
    self.objArithmeticOperation.intValue1 = 5;
    self.objArithmeticOperation.intValue2 = 4;
    
    int intAddResult = [self.objArithmeticOperation Add];
    NSLog(@"Add result: %i", intAddResult);
    
    int intSubResult = [self.objArithmeticOperation Sub];
    NSLog(@"Sub result: %i", intSubResult);
    
    int intMultResult = [self.objArithmeticOperation MultiplyValues:self.objArithmeticOperation.intValue1
                                                           andValue:self.objArithmeticOperation.intValue2];
    NSLog(@"Mult result: %i", intMultResult);
}

- (void) looping
{
    /*
    for (int i = 0; i < 10; i++) {
        NSLog(@"Index: %i", i);
    }
    */
    
    /*
    for (int i = 10; i > 0; i--) {
        NSLog(@"Index: %i", i);
    }
    */
    
    /*
    int i,j;
    for (i = 0, j = 1; i < 10; i++, j*=2)
    {
        NSLog(@"I: %i, J: %i", i, j);
        
        if (i == 3)
        {
            break;
        }
    }
    */
    
    /*
    //do while
    int i = 0;
    do {
        NSLog(@"%i", i);
        i++;
    } while (i < 10);
    */
    
    //while
    int i = 0;
    while (i < 10) {
        NSLog(@"%i", i);
        i++;
    }
    
}

- (void) decisions
{
    //If
    int i;
    i = 10;
    
    //one line execution
    /*
    if (i==10)
        NSLog(@"I is equal to 10");
    else
        NSLog(@"I is not equal to 10");
    */
    
    //multiple line execution
    /*
    if (i == 10) {
        NSLog(@"I is equal to 10");
        i = i + 1;
    } else {
        NSLog(@"I is equal to 10");
        i = i - 1;
    }
    */
    
    //muliple condition check
    /*
    if (i > 2 && i < 6) {
        NSLog(@"I is between 2 and 6");
        i++;
    } else {
        NSLog(@"I is not between 2 and 6");
        i++;
    }
    */
    
    /*
    if (i > 2 || i < 6) {
        NSLog(@"I is either greater than 2 or less than 6");
        i++;
    } else {
        NSLog(@"I is neither greater than 2 nor less than 6");
        i++;
    }
    */
    
    //nested if...else
    if (i == 2) {
        NSLog(@"I is equal to 2");
        i++;
    } else if (i == 5) {
        NSLog(@"I is equal to 5");
        i++;
    } else if (i == 6) {
        NSLog(@"I is equal to 6");
        i++;
    } else {
        NSLog(@"I is not equal to 3 or 5 or 6");
        i++;
    }
    
    
    //Switch
    switch (i) {
        case 1:
            NSLog(@"i is 1");
            break;
        case 2:
            NSLog(@"i is 2");
            break;
        case 4:
            NSLog(@"i is 4");
            break;
        default:
            NSLog(@"i is not 1, 2 or 4");
            break;
    }
}

//- (IBAction)btnAdd_Click:(id)sender
//{
//    //check txtVal1 and txtVal2 for values
//    if (self.txtValue1.text.length > 0
//        && self.txtValue2.text.length > 0) {
//    
//        self.objArithmeticOperation.intValue1 = [self.txtValue1.text floatValue];
//        self.objArithmeticOperation.intValue2 = [self.txtValue2.text floatValue];
//        
//        self.lblResult.text =
//        [NSString stringWithFormat:@"Result: %.02f", [self.objArithmeticOperation Add]];
//    }
//    else if (!self.txtValue1.text.length > 0
//               || !self.txtValue2.text.length > 0)
//    {
//        self.lblResult.text = @"Please enter both values";
//    }
//    
//}
//
//- (IBAction)btnSub_Click:(id)sender
//{
//    //check txtVal1 and txtVal2 for values
//    if (self.txtValue1.text.length > 0
//        && self.txtValue2.text.length > 0) {
//        
//        self.objArithmeticOperation.intValue1 = [self.txtValue1.text integerValue];
//        self.objArithmeticOperation.intValue2 = [self.txtValue2.text integerValue];
//        
//        self.lblResult.text =
//        [NSString stringWithFormat:@"Result: %.02f", [self.objArithmeticOperation Sub]];
//    }
//    else if (!self.txtValue1.text.length > 0
//               || !self.txtValue2.text.length > 0)
//    {
//        self.lblResult.text = @"Please enter both values";
//    }
//}

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
    [self callAlertView];
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

@end
