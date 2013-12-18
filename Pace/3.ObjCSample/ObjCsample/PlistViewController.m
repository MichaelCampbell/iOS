//
//  PlistViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 12/17/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "PlistViewController.h"

@interface PlistViewController ()
- (IBAction)btnBack_Click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUserId;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(UIButton *)sender;

@end

@implementation PlistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self getBackData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack_Click:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 [self dismissCompleted];
                             }];
}

- (void) dismissCompleted
{
    NSLog(@"Dismiss completed");
}

- (IBAction)btnLogin:(UIButton *)sender
{
    NSString *strPath;
    NSMutableDictionary *objDictionary;
    
    strPath = [NSString stringWithFormat:@"%@/Library/Preferences/Cookies.plist", NSHomeDirectory()];
    NSLog(@"plist path: %@", strPath);
    objDictionary = [[NSMutableDictionary alloc] init];
    [objDictionary setValue:self.txtUserId.text
                     forKey:@"USERID"];
    [objDictionary setValue:self.txtPassword.text
                     forKey:@"PASSWORD"];
    
    [objDictionary writeToFile:strPath
                    atomically:NO];
}

- (void) getBackData
{
    NSString *strPath;
    NSMutableDictionary *objDictionary;
    
    strPath = [NSString stringWithFormat:@"%@/Library/Preferences/Cookies.plist", NSHomeDirectory()];
    objDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:strPath];
    
    if (objDictionary != nil) {
        NSLog(@"objDictionary is not nil");
        self.txtUserId.text = [objDictionary valueForKey:@"USERID"];
        self.txtPassword.text = [objDictionary valueForKey:@"PASSWORD"];
    }
}
@end
