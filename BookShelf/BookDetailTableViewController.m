//
//  BookDetailTableViewController.m
//  BookShelf
//
//  Created by Rita on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import "BookDetailTableViewController.h"
#import "BookInfoCell.h"
#import <MagicalRecord.h>

@interface BookDetailTableViewController ()
@property (strong, nonatomic) Book *book;
@end

@implementation BookDetailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _book = _viewMode == 0 ? _selectedBook : [Book MR_createEntity];
    _book.buyDate = _viewMode == 0 ? _book.buyDate : [NSDate date];
    [self.tableView registerNib:[UINib nibWithNibName:@"BookInfoCell" bundle:nil] forCellReuseIdentifier:@"BookInfoCell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    if (_viewMode == 0) //Edit mode
        return 4;
    else //New mode
        return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    switch (indexPath.row) {
        case 0: {
            BookInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookInfoCell"
                                     forIndexPath:indexPath];
            [cell setInfo:@"Name" value:_book.bookName mode:_viewMode];
            return cell;
        }
        case 1: {
            BookInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookInfoCell"
                                     forIndexPath:indexPath];
            [cell setInfo:@"Purchase Date" value:[_book buyDateToString] mode:_viewMode];

            //Use NSDateFormatter to write out the date in a friendly format
            UIDatePicker *timePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 0, 0)];
            [timePicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
            timePicker.datePickerMode = UIDatePickerModeDate;
            [cell.cellValue setInputView:timePicker];

            return cell;
        }
        case 2: {
            BookInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookInfoCell"
                                     forIndexPath:indexPath];
            [cell setInfo:@"Price" value:[_book.buyPrice stringValue] mode:_viewMode];
            [cell.cellValue setKeyboardType:UIKeyboardTypeDecimalPad];
            return cell;
        }
        case 3: {
            UITableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:@"history"];
            return normalCell;
        }
        default:
            break;
    }
    
    // Configure the cell...
    
    return nil;
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
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updateBookInfo:(id)sender {

    
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    BookInfoCell *cell = (BookInfoCell *)[self.tableView cellForRowAtIndexPath:index];
    _book.bookName = cell.cellValue.text;
    
    index = [NSIndexPath indexPathForRow:2 inSection:0];
    cell = (BookInfoCell *)[self.tableView cellForRowAtIndexPath:index];
    _book.buyPrice = @([cell.cellValue.text doubleValue]);
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReadingRecordSegue"]) {
        [[segue destinationViewController] setBook:_book];
    }
}

#pragma mark - private
- (void)pickerChanged:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d/M/Y"];
    NSIndexPath *index = [NSIndexPath indexPathForRow:1 inSection:0];
    BookInfoCell *cell = (BookInfoCell *)[self.tableView cellForRowAtIndexPath:index];
    cell.cellValue.text = [formatter stringFromDate:[sender date]];
    _book.buyDate = [sender date];
}
@end
