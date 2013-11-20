//
//  ArithmeticOperations.m
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "ArithmeticOperations.h"

@implementation ArithmeticOperations

- (float) Add
{
    return self.intValue1 + self.intValue2;
}

- (float) Sub
{
    return self.intValue1 - self.intValue2;
}

- (float) MultiplyValues:(float)firstVal
              andValue:(float)secondVal
{
    return firstVal * secondVal;
}

@end
