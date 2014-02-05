//
//  AdSampleViewController.m
//  mapsample
//
//  Created by Michael Campbell on 2/4/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "AdSampleViewController.h"

@interface AdSampleViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tblView;

@end

@implementation AdSampleViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        //Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    self.objBannerView = [[ADBannerView alloc] init];
    
    self.objBannerView.delegate = self;
    //at bottom
//    self.objBannerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.tblView.frame.size.width, self.tblView.frame.size.height);
    
    //at top
    self.objBannerView.frame = CGRectMake(0, -self.objBannerView.frame.size.height, self.objBannerView.frame.size.width, self.objBannerView.frame.size.height);
    
    [self.view addSubview:self.objBannerView];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.isBannerVisible) {
        [UIView beginAnimations:nil
                        context:nil];
        CGRect newControlFrame;
        newControlFrame = self.tblView.frame;
        //at bottom
//        newControlFrame.size.height -= banner.frame.size.height;
//        self.tblView.frame = newControlFrame;
//        self.tblView.backgroundColor = [UIColor redColor];
//        
//        banner.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - banner.frame.size.height, self.tblView.frame.size.width, self.tblView.frame.size.height);
        
        //at top
        newControlFrame.size.height -= banner.frame.size.height;
        newControlFrame.origin.y = self.objBannerView.frame.size.height;
        
        self.tblView.frame = newControlFrame;
        self.tblView.backgroundColor = [UIColor redColor];
        
        banner.frame = CGRectMake(0, 0, banner.frame.size.width, banner.frame.size.height);
        
        [UIView commitAnimations];
        self.isBannerVisible = YES;

    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.isBannerVisible) {
        [UIView beginAnimations:nil
                        context:nil];
        CGRect newControlFrame;
        newControlFrame = self.tblView.frame;
        newControlFrame.size.height -= banner.frame.size.height;
        self.tblView.frame = newControlFrame;
        self.tblView.backgroundColor = [UIColor blueColor];
        
        banner.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - banner.frame.size.height, self.tblView.frame.size.width, self.tblView.frame.size.height);
        
        [UIView commitAnimations];
        self.isBannerVisible = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = @"Sample Text";
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
