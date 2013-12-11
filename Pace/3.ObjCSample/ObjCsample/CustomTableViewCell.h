//
//  CustomTableViewCell.h
//  ObjCsample
//
//  Created by Michael Campbell on 12/5/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *imageView1;
@property (nonatomic, retain) IBOutlet UIImageView *imageView2;
@property (nonatomic, retain) IBOutlet UIImageView *imageView3;
@property (nonatomic, retain) IBOutlet UIImageView *imageView4;

@property (nonatomic, retain) IBOutlet UILabel *lbl1;
@property (nonatomic, retain) IBOutlet UILabel *lbl2;

@property (nonatomic, retain) IBOutlet CustomButton *btnCall;
@property (nonatomic, retain) IBOutlet CustomButton *btnEmail;
@property (nonatomic, retain) IBOutlet CustomButton *btnWebsite;

@end
