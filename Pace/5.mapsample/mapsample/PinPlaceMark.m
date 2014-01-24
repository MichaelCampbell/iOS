//
//  PinPlaceMark.m
//  mapsample
//
//  Created by Michael Campbell on 1/23/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "PinPlaceMark.h"

@implementation PinPlaceMark

- (instancetype) initWithCoordinate: (CLLocationCoordinate2D) coordinate
{
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
    }
    
    return self;
}

- (NSString *) subtitle
{
    return self.mySubTitle;
}


- (NSString *) title
{
    return self.myTitle;
}

@end
