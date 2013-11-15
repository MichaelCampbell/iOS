//
//  ArithmeticOperations.h
//  ObjCsample
//
//  Created by Michael Campbell on 11/14/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArithmeticOperations : NSObject

@property (nonatomic, assign) int intValue1;
@property (nonatomic, assign) int intValue2;

- (int) Add;
- (int) Sub;
- (int) MultiplyValues: (int) firstVal
              andValue: (int) secondVal;

@end
