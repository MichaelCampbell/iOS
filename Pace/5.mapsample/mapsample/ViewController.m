//
//  ViewController.m
//  mapsample
//
//  Created by Michael Campbell on 1/23/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewController.h"
#import "PinPlaceMark.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.map setDelegate:self];

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self zoomIn];
    [self AddPin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) zoomIn
{
    MKCoordinateRegion myRegion;
    MKCoordinateSpan span;
    
    //Zoom level
    span.latitudeDelta = 0.02;
    span.longitudeDelta = 0.02;
    
    //Location to display.
    CLLocationCoordinate2D myLocation;
    myLocation.latitude = 41.056573;
    myLocation.longitude = -74.181061;
    
    myRegion.span = span;
    myRegion.center = myLocation;
    
    [self.map setRegion:myRegion];
    [self.map regionThatFits:myRegion];
    
}

- (void) AddPin
{
    CLLocationCoordinate2D pinLocation;
    pinLocation.latitude = 41.056573;
    pinLocation.longitude = -74.181061;
    
    PinPlaceMark *placeMark = [[PinPlaceMark alloc]initWithCoordinate:pinLocation];
    
    placeMark.myTitle = @"iOS Class";
    placeMark.mySubTitle = @"163 Williams ST";
    
    [self.map addAnnotation:placeMark];
    
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                   reuseIdentifier:@"currentloc"];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [rightButton addTarget:self
                    action:@selector(pinRightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    pinView.rightCalloutAccessoryView = rightButton;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    [leftButton addTarget:self
                    action:@selector(pinLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    pinView.leftCalloutAccessoryView = leftButton;
    
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    
    return pinView;
}

- (void) pinRightButton:(id)sender
{
    UIAlertView *objAlert = [[UIAlertView alloc] initWithTitle:@"Right button"
                                                       message:@"clicked"
                                                      delegate:nil
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles: nil];
    [objAlert show];
}

- (void) pinLeftButton:(id)sender
{
    UIAlertView *objAlert = [[UIAlertView alloc] initWithTitle:@"Left button"
                                                       message:@"clicked"
                                                      delegate:nil
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles: nil];
    [objAlert show];
}

@end
