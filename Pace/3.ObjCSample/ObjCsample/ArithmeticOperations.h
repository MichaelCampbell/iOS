//
//  ArithmeticOperations.h
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArithmeticOperations : NSObject

@property (nonatomic, assign) float intValue1;
@property (nonatomic, assign) float intValue2;

- (float) Add;
- (float) Sub;
- (float) MultiplyValues: (float) firstVal
              andValue: (float) secondVal;

@end
