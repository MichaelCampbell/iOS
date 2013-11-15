//
//  ArithmeticOperations.m
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "ArithmeticOperations.h"

@implementation ArithmeticOperations

- (int) Add
{
    return self.intValue1 + self.intValue2;
}

- (int) Sub
{
    return self.intValue1 - self.intValue2;
}

- (int) MultiplyValues:(int)firstVal
              andValue:(int)secondVal
{
    return firstVal * secondVal;
}

@end
