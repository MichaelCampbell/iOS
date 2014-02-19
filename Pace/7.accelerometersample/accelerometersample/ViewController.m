//
//  ViewController.m
//  accelerometersample
//
//  Created by Michael Campbell on 2/18/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblAccX;
@property (weak, nonatomic) IBOutlet UILabel *lblAccY;
@property (weak, nonatomic) IBOutlet UILabel *lblAccZ;

@property (weak, nonatomic) IBOutlet UILabel *lblGyroX;
@property (weak, nonatomic) IBOutlet UILabel *lblGyroY;
@property (weak, nonatomic) IBOutlet UILabel *lblGyroZ;

@property (weak, nonatomic) IBOutlet UILabel *lblMagnetX;
@property (weak, nonatomic) IBOutlet UILabel *lblMagnetY;
@property (weak, nonatomic) IBOutlet UILabel *lblMagnetZ;

@property (weak, nonatomic) IBOutlet UILabel *lblMotionX;
@property (weak, nonatomic) IBOutlet UILabel *lblMotionY;
@property (weak, nonatomic) IBOutlet UILabel *lblMotionZ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self instantiateAccelerometer];
    [self instantiateGyroscope];
    [self instantiateMagnetometer];
    [self instantiateDeviceMotion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CMMotionManager *) objMotionManager
{
    if (!_objMotionManager) {
        _objMotionManager = [[CMMotionManager alloc] init];
    }
    return _objMotionManager;
}

- (void) instantiateAccelerometer
{
    self.objMotionManager.accelerometerUpdateInterval = 2;
    
    [self.objMotionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                                withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                    self.lblAccX.text = [NSString stringWithFormat:@"%f", accelerometerData.acceleration.x];
                                                    self.lblAccY.text = [NSString stringWithFormat:@"%f", accelerometerData.acceleration.y];
                                                    self.lblAccZ.text = [NSString stringWithFormat:@"%f", accelerometerData.acceleration.z];
                                                }];
}

- (void) instantiateGyroscope
{
    self.objMotionManager.gyroUpdateInterval = 2;
    
    [self.objMotionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue]
                                       withHandler:^(CMGyroData *gyroData, NSError *error) {
                                           self.lblGyroX.text = [NSString stringWithFormat:@"%f", gyroData.rotationRate.x];
                                           self.lblGyroY.text = [NSString stringWithFormat:@"%f", gyroData.rotationRate.y];
                                           self.lblGyroZ.text = [NSString stringWithFormat:@"%f", gyroData.rotationRate.z];
                                       }];
}

- (void) instantiateMagnetometer
{
    self.objMotionManager.magnetometerUpdateInterval = 2;
    
    [self.objMotionManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                               withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
                                                   self.lblMagnetX.text = [NSString stringWithFormat:@"%f", magnetometerData.magneticField.x];
                                                   self.lblMagnetY.text = [NSString stringWithFormat:@"%f", magnetometerData.magneticField.y];
                                                   self.lblMagnetZ.text = [NSString stringWithFormat:@"%f", magnetometerData.magneticField.z];
                                       }];
}

- (void) instantiateDeviceMotion
{
    self.objMotionManager.deviceMotionUpdateInterval = 2;
    
    [self.objMotionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                               withHandler:^(CMDeviceMotion *motion, NSError *error) {
                                                   self.lblMotionX.text = [NSString stringWithFormat:@"%f", motion.userAcceleration.x];
                                                   self.lblMotionY.text = [NSString stringWithFormat:@"%f", motion.userAcceleration.y];
                                                   self.lblMotionZ.text = [NSString stringWithFormat:@"%f", motion.userAcceleration.z];
                                               }];
}

@end
