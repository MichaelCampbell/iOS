//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Michael Campbell on 12/9/12.
//  Copyright (c) 2012 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end
