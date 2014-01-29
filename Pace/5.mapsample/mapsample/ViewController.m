//
//  ViewController.m
//  mapsample
//
//  Created by Michael Campbell on 1/23/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewController.h"
#import "PinPlaceMark.h"
#import "DetailViewController.h"
#import "PinLocation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, strong) NSMutableArray *pinLocations;

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
    
    [self loadContents];
    [self zoomIn];
    [self AddPin];
}

- (void) loadContents
{
    self.pinLocations = [[NSMutableArray alloc] init];
    
    PinLocation *location1 = [[PinLocation alloc] init];
    
    location1.Title = @"Dunkin";
    location1.SubTitle = @"Coffee Shop";
    CLLocationCoordinate2D clLocation1;
    clLocation1.latitude = 41.056573;
    clLocation1.longitude = -74.181061;
    location1.Location = clLocation1;
    [self.pinLocations addObject:location1];
    
    PinLocation *location2 = [[PinLocation alloc] init];
    
    location2.Title = @"Moes";
    location2.SubTitle = @"Restaurant";
    CLLocationCoordinate2D clLocation2;
    clLocation2.latitude = 41.057573;
    clLocation2.longitude = -74.181061;
    location2.Location = clLocation2;
    [self.pinLocations addObject:location2];
    
    PinLocation *location3 = [[PinLocation alloc] init];
    
    location3.Title = @"On the border";
    location3.SubTitle = @"Restaurant";
    CLLocationCoordinate2D clLocation3;
    clLocation3.latitude = 41.058573;
    clLocation3.longitude = -74.181061;
    location2.Location = clLocation3;
    [self.pinLocations addObject:location3];

    
}

- (void) AddPin
{
    int counter = 0;
    for (PinLocation *location in self.pinLocations) {
        PinPlaceMark *placeMark = [[PinPlaceMark alloc] initWithCoordinate:location.Location];
        placeMark.myTitle = location.Title;
        placeMark.mySubTitle = location.SubTitle;
        
        placeMark.intlocationIndex = counter;
        
        counter++;
        
        [self.map addAnnotation:placeMark];
    }
    
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



- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                   reuseIdentifier:@"currentloc"];
    
    PinPlaceMark *placeMark = (PinPlaceMark *) annotation;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    rightButton.tag = placeMark.intlocationIndex;
    
    [rightButton addTarget:self
                    action:@selector(pinRightButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    pinView.rightCalloutAccessoryView = rightButton;
    
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    [leftButton addTarget:self
                   action:@selector(pinLeftButton:)
         forControlEvents:UIControlEventTouchUpInside];
    
    pinView.leftCalloutAccessoryView = leftButton;
    
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    
    return pinView;
}

- (void) pinRightButton:(id)sender
{
//    UIAlertView *objAlert = [[UIAlertView alloc] initWithTitle:@"Right button"
//                                                       message:@"clicked"
//                                                      delegate:nil
//                                             cancelButtonTitle:@"Cancel"
//                                             otherButtonTitles: nil];
//    [objAlert show];
    
    UIButton *objButton = (UIButton *) sender;
    
    NSLog(@"%i", objButton.tag);
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
    DetailViewController *objDetailViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    PinLocation *currentPinLocation = [self.pinLocations objectAtIndex:objButton.tag];
    objDetailViewController.objPinLocation.Location = currentPinLocation.Location;
    objDetailViewController.DetailViewControllerTitle = currentPinLocation.Title;
    objDetailViewController.DetailViewControllerSubTitle = currentPinLocation.SubTitle;
    
    [self presentViewController:objDetailViewController
                       animated:YES
                     completion:nil];
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
