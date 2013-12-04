//
//  SampleTableViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 12/3/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "SampleTableViewController.h"

@interface SampleTableViewController ()
@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (strong, nonatomic) NSDictionary *friendsSet;
@property (strong, nonatomic) NSDictionary *emergencySet;
@end

@implementation SampleTableViewController

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
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *) friendsSet
{
    NSDictionary *friends = @{@"Red": @"Red description"};
    
    return friends;

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    else
    {
        return 5;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Green";
            cell.textLabel.textColor = [UIColor greenColor];
            cell.detailTextLabel.text = @"GreenDetail";
            break;
        default:
            cell.textLabel.text = @"Red";
            cell.textLabel.textColor = [UIColor redColor];
            cell.detailTextLabel.text = @"RedDetail";
            break;
    }
    
    cell.imageView.image = [UIImage imageNamed:@"star.jpg"];

    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Friends";
    }
    else
    {
        return @"Emergency";
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Footer of Friends section";
    }
    else
    {
        return @"Footer of Emergency section";
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

@end
