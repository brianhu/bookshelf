//
//  ReadingHistoryTableViewController.h
//  BookShelf
//
//  Created by Brian Hu on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReadingRecordPopupViewController.h"

@interface ReadingHistoryTableViewController : UITableViewController <AddReadingRecordPopupViewDelegate, NSFetchedResultsControllerDelegate>

- (IBAction)AddRecord:(id)sender;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
