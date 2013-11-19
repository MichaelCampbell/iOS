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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self testHarness];
    [self looping];
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
    
}

@end
