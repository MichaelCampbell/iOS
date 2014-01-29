//
//  PinLocation.h
//  mapsample
//
//  Created by Michael Campbell on 1/28/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import Foundation;
@import MapKit;

@interface PinLocation : NSObject

@property (nonatomic, strong) NSString *Title;
@property (nonatomic, strong) NSString *SubTitle;
@property (nonatomic, readwrite) CLLocationCoordinate2D Location;

@end
