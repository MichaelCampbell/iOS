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
    for (int i = 0; i < 10; i++) {
        NSLog(@"Index: %i", i);
    }
    
}

@end
