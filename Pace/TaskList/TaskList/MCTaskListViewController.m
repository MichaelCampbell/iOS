//
//  MCTaskListViewController.m
//  TaskList
//
//  Created by Michael Campbell on 12/18/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "MCTaskListViewController.h"

@interface MCTaskListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TaskListInputField;
- (IBAction)AddTaskListItem:(UIButton *)sender;
- (IBAction)SaveTaskListItems:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *TaskListTable;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation MCTaskListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.TaskListTable setDataSource:self];
    [self.TaskListTable setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //get data from TaskList
    NSString *path = [NSString stringWithFormat:@"%@/Library/Preferences/TaskList.plist", NSHomeDirectory()];
    
    NSMutableArray *tasklist = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    if (tasklist) {
        self.dataSource = tasklist;
        [self.TaskListTable reloadData];
    }
    
}

- (NSMutableArray *) dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (IBAction)AddTaskListItem:(UIButton *)sender
{
    if ([self.TaskListInputField.text length] > 0) {
        [self.dataSource addObject:[NSString stringWithFormat:@"%@", self.TaskListInputField.text]];
        NSLog(@"%@", self.dataSource);
        self.TaskListInputField.text = nil;
        [self.TaskListTable reloadData];
//        [self SaveTaskListItems:sender];
    }
}

- (void) tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.TaskListInputField resignFirstResponder];
}

- (IBAction)SaveTaskListItems:(UIButton *)sender
{
    NSString *path = [NSString stringWithFormat:@"%@/Library/Preferences/TaskList.plist", NSHomeDirectory()];
    [self.dataSource writeToFile:path atomically:NO];
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] init];
    
    if (self.dataSource) {
        tableViewCell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    }
    return tableViewCell;
}
@end
