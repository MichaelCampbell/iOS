//
//  PickerViewController.h
//  ObjCsample
//
//  Created by Michael Campbell on 11/21/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface PickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray *arrComponent0;
@property (strong, nonatomic) NSMutableArray *arrComponent1;

@property (strong, nonatomic) Contact *objContact;
@property (strong, nonatomic) NSString *name;

@end
