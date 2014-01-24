//
//  PinPlaceMark.h
//  mapsample
//
//  Created by Michael Campbell on 1/23/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import MapKit;
@import Foundation;

@interface PinPlaceMark : NSObject <MKAnnotation>

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *myTitle;
@property (nonatomic, strong) NSString *mySubTitle;

- (instancetype) initWithCoordinate: (CLLocationCoordinate2D) coordinate;

@end
