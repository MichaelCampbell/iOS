//
//  SecondViewController.h
//  firstsample
//
//  Created by Michael Campbell on 11/7/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnGotoFirst;

- (IBAction)btnGotoFirst_Click:(UIButton *)sender;

@end
