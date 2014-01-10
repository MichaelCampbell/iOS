//
//  SqLiteViewController.h
//  ObjCsample
//
//  Created by Michael Campbell on 12/19/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

@import UIKit;
#import <sqlite3.h>

@interface SqLiteViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite) sqlite3 *database;

@end
