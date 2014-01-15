//
//  WebServiceViewController.h
//  ObjCsample
//
//  Created by Michael Campbell on 1/14/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebServiceViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, retain) NSMutableData *receivedData;

@end
