//
//  SqLiteViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 12/19/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "SqLiteViewController.h"

@interface SqLiteViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation SqLiteViewController

@synthesize database;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.table.dataSource = self;
    self.table.delegate = self;
    [self openDBConnection];
    NSLog(@"%@", self.data);
}

- (NSMutableArray *) data
{
    if (!_data) {
        _data = [[NSMutableArray alloc] init];
    }
    
    return _data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openDBConnection
{
    NSString *strFromPath;
    NSString *strToPath;
    
    strFromPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"university.sqlite"];
    strToPath = [NSString stringWithFormat:@"%@/Library/Preferences/university.sqlite", NSHomeDirectory()];
    
    NSFileManager *objFileManager = [NSFileManager defaultManager];

    [objFileManager copyItemAtPath:strFromPath
                            toPath:strToPath
                             error:nil];
    
    if (sqlite3_open([strToPath UTF8String], &database) == SQLITE_OK)
    {
        const char *sqlStatement = "SELECT * FROM STUDENT";
        sqlite3_stmt *compiledStatement;
        
        if (sqlite3_prepare(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                NSLog(@"ID: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 0)]);
                [self.data addObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 1)]];
                NSLog(@"Firstname : %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 1)]);
                NSLog(@"LastName: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 2)]);
                NSLog(@"Address: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 3)]);
                NSLog(@"City: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 4)]);
                NSLog(@"State: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 5)]);
                NSLog(@"ZipCode: %@", [NSString stringWithUTF8String:(char *) sqlite3_column_text(compiledStatement, 6)]);
            }
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    
    return cell;
}

@end
