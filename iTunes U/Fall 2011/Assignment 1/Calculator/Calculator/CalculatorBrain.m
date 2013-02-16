//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Michael Campbell on 12/9/12.
//  Copyright (c) 2012 Michael Campbell. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
	if (_operandStack == nil) {
		_operandStack = [[NSMutableArray alloc] init];
	}
	return _operandStack;
}

-(double)popOperand
{
	NSNumber *operandObject = [self.operandStack lastObject];
	
	if(operandObject)
	{
		[self.operandStack removeLastObject];
	}
	
	return [operandObject doubleValue];
}

-(void)pushOperand:(double)operand
{
	[self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)performOperation:(NSString *)operation
{
	double result = 0;

	if([operation isEqualToString:@"+"])
	{
		result = [self popOperand] + [self popOperand];
	}else if ([@"*" isEqualToString:operation])
	{
		result = [self popOperand] * [self popOperand];
	}else if ([@"/" isEqualToString:operation])
	{
		result = [self popOperand] / [self popOperand];
	}else if ([@"-" isEqualToString:operation])
	{
		result = [self popOperand] - [self popOperand];
	}
	return result;
}

@end
