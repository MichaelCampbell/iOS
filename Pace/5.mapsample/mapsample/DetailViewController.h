//
//  DetailViewController.h
//  mapsample
//
//  Created by Michael Campbell on 1/28/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import UIKit;
#import "PinLocation.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) PinLocation *objPinLocation;
@property (weak, nonatomic) NSString *DetailViewControllerTitle;
@property (weak, nonatomic) NSString *DetailViewControllerSubTitle;

@end
