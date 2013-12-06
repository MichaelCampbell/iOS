//
//  SampleTableViewController.h
//  ObjCsample
//
//  Created by Michael Campbell on 12/3/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *arrContactFriends;
@property (nonatomic, retain) NSMutableArray *arrContactEmergency;
@end
