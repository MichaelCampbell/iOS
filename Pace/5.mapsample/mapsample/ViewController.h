//
//  ViewController.h
//  mapsample
//
//  Created by Michael Campbell on 1/23/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import UIKit;
@import MapKit;
@import CoreLocation;

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) NSMutableArray *objPinLocations;
@property (nonatomic, strong) CLLocationManager *objCLManager;

@end
