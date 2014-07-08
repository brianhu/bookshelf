//
//  ReadingRecordTableViewController.h
//  BookShelf
//
//  Created by Brian Hu on 7/8/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface ReadingRecordTableViewController : UITableViewController  <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Book *book;
- (IBAction)addRecord:(id)sender;
@end
