//
//  AdSampleViewController.h
//  mapsample
//
//  Created by Michael Campbell on 2/4/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import UIKit;
@import iAd;

@interface AdSampleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate>

@property (nonatomic, strong) ADBannerView *objBannerView;
@property (readwrite) BOOL isBannerVisible;

@end
