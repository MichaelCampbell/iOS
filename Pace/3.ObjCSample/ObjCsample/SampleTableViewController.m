//
//  SampleTableViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 12/3/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "SampleTableViewController.h"
#import "Contact.h"

@interface SampleTableViewController ()
@property (nonatomic, retain) IBOutlet UITableView *tblView;
//@property (strong, nonatomic) NSMutableArray *friends;
//@property (strong, nonatomic) NSMutableArray *emergency;
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
    
    self.arrContactFriends = [[NSMutableArray alloc] init];

    //Contact 0
    Contact *friend0 = [[Contact alloc] init];
    friend0.FirstName = @"John";
    friend0.LastName = @"Smith";
    friend0.Street = @"163 William Street";
    friend0.City = @"New York";
    friend0.State = @"NY";
    friend0.Zip = @"10038";
    friend0.Mobile = @"973-568-8956";
    friend0.Email = @"info@pace.edu";
    friend0.Website = @"www.msn.com";
    [self.arrContactFriends addObject:friend0];
    
    //Contact 1
    Contact *friend2 = [[Contact alloc] init];
    friend2.FirstName = @"Mark";
    friend2.LastName = @"Neretic";
    friend2.Street = @"56 Scott Street";
    friend2.City = @"New Brunswick";
    friend2.State = @"NJ";
    friend2.Zip = @"08932";
    friend2.Mobile = @"896-896-8956";
    friend2.Email = @"rich@gmail.com";
    friend2.Website = @"www.pace.com";
    [self.arrContactFriends addObject:friend2];
    
    
    self.arrContactEmergency = [[NSMutableArray alloc] init];
    
    //Contact 0
    Contact *objContact0 = [[Contact alloc] init];
    objContact0.FirstName = @"John";
    objContact0.LastName = @"Smith";
    objContact0.Street = @"163 William Street";
    objContact0.City = @"New York";
    objContact0.State = @"NY";
    objContact0.Zip = @"10038";
    objContact0.Mobile = @"123-456-7890";
    objContact0.Email = @"info@pace.edu";
    objContact0.Website = @"info.pace.edu";
    [self.arrContactEmergency addObject:objContact0];
    
    //Contact 1
    Contact *objContact1 = [[Contact alloc] init];
    objContact1.FirstName = @"Mark";
    objContact1.LastName = @"Neretic";
    objContact1.Street = @"56 Scott Street";
    objContact1.City = @"New Brunswick";
    objContact1.State = @"NJ";
    objContact1.Zip = @"08932";
    objContact1.Mobile = @"896-896-8956";
    objContact1.Email = @"rich@gmail.com";
    objContact1.Website = @"rich.gmail.com";
    [self.arrContactEmergency addObject:objContact1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSMutableArray *) friends
//{
//    NSMutableArray *arr = [[NSMutableArray alloc] init];
//    Contact *friend1 = [[Contact alloc] init];
//    friend1.name = @"John Doe";
//    friend1.details = @"John Doe Inc.";
//    [arr addObject:friend1];
//    
//    Contact *friend2 = [[Contact alloc] init];
//    friend2.name = @"Jane Doe";
//    friend2.details = @"Doe Co.";
//    [arr addObject:friend2];
//    
//    Contact *friend3 = [[Contact alloc] init];
//    friend3.name = @"Jim Doe";
//    friend3.details = @"Jimmy's";
//    [arr addObject:friend3];
//    
//    return arr;
//}

//- (NSMutableArray *) emergency
//{
//    NSMutableArray *arr = [[NSMutableArray alloc] init];
//    Contact *emergency1 = [[Contact alloc] init];
//    emergency1.name = @"Best Hospital";
//    emergency1.details = @"Emergency Room";
//    [arr addObject:emergency1];
//    
//    return arr;
//}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
//        return [self.friends count];
        return [self.arrContactFriends count];
    }
    else
    {
//        return [self.emergency count];
        return [self.arrContactEmergency count];
    }
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:CellIdentifier];
//        cell.detailTextLabel.numberOfLines = 2;
//    }
//    
////    switch (indexPath.section) {
////        case 0:
////            cell.textLabel.text = [[self.friends objectAtIndex:indexPath.row] name];
////            cell.textLabel.textColor = [UIColor blueColor];
////            cell.detailTextLabel.text = [[self.friends objectAtIndex:indexPath.row] details];
////            break;
////        case 1:
////            cell.textLabel.text = [[self.emergency objectAtIndex:indexPath.row] name];
////            cell.textLabel.textColor = [UIColor redColor];
////            cell.detailTextLabel.text = [[self.emergency objectAtIndex:indexPath.row] details];
////            break;
////        default:
////            break;
////    }
//    
//    Contact *objContact;
//    
//    if (indexPath.section == 0) {
//        objContact = [self.arrContactFriends objectAtIndex:indexPath.row];
//    } else {
//        objContact = [self.arrContactEmergency objectAtIndex:indexPath.row];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", objContact.LastName, objContact.FirstName];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@, %@ %@", objContact.Street, objContact.City, objContact.State, objContact.Zip];
//    
//    cell.imageView.image = [UIImage imageNamed:@"star.jpg"];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
    
    static NSString *CellIdentifier = @"CustomCell";
    NSArray *topLevelObjects;
    
    CustomTableViewCell *objCell = (CustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (objCell == nil) {
        topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell"
                                                        owner:nil
                                                      options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[CustomTableViewCell class]]) {
                objCell = (CustomTableViewCell *) currentObject;
                [objCell.btnCall addTarget:self
                                    action:@selector(btnCall:)
                          forControlEvents:UIControlEventTouchUpInside];
                [objCell.btnEmail addTarget:self
                                     action:@selector(btnEmail:)
                           forControlEvents:UIControlEventTouchUpInside];
                [objCell.btnWebsite addTarget:self
                                       action:@selector(btnWebsite:)
                             forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    
    Contact *objContact;
    
    if (indexPath.section == 0) {
        objContact = [self.arrContactFriends objectAtIndex:indexPath.row];
    } else {
        objContact = [self.arrContactEmergency objectAtIndex:indexPath.row];
    }

    
    objCell.lbl1.text = [NSString stringWithFormat:@"%@, %@", objContact.LastName, objContact.FirstName];
    objCell.lbl2.text = [NSString stringWithFormat:@"%@\n%@, %@ %@", objContact.Street, objContact.City, objContact.State, objContact.Zip];
    
    objCell.btnCall.strData = objContact.Mobile;
    objCell.btnEmail.strData = objContact.Email;
    objCell.btnWebsite.strData = objContact.Website;
    
    objCell.imageView1.image = [UIImage imageNamed:@"star.jpg"];
    objCell.imageView2.image = [UIImage imageNamed:@"star.jpg"];
    objCell.imageView3.image = [UIImage imageNamed:@"star.jpg"];
    objCell.imageView4.image = [UIImage imageNamed:@"star.jpg"];
    
    return objCell;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *objStoryBoard = [UIStoryboard storyboardWithName:@"Main"
                                                            bundle:nil];
    PickerViewController *objPickerViewController = [objStoryBoard instantiateViewControllerWithIdentifier:@"PickerViewController"];
    if (indexPath.section == 0) {
        objPickerViewController.objContact = [self.arrContactFriends objectAtIndex:indexPath.row];
    }
    else
    {
        objPickerViewController.objContact = [self.arrContactEmergency objectAtIndex:indexPath.row];
    }
    objPickerViewController.name = @"Bob";
    [self presentViewController:objPickerViewController
                       animated:YES
                     completion:nil];
    
}

- (IBAction)btnCall:(id)sender
{
    CustomButton *objButton = (CustomButton *) sender;
    
    UIAlertView *objAlertView = [[UIAlertView alloc] initWithTitle:objButton.strData
                                                           message:@""
                                                          delegate:nil
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:nil];
    [objAlertView show];
}

- (IBAction)btnEmail:(id)sender
{
    CustomButton *objButton = (CustomButton *) sender;
    UIAlertView *objAlertView = [[UIAlertView alloc] initWithTitle:objButton.strData
                                                           message:@""
                                                          delegate:nil
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:nil];
    [objAlertView show];
}

- (IBAction)btnWebsite:(id)sender
{
    CustomButton *objButton = (CustomButton *) sender;
    UIAlertView *objAlertView = [[UIAlertView alloc] initWithTitle:objButton.strData
                                                           message:@""
                                                          delegate:nil
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:nil];
    [objAlertView show];
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
    return 170;
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
