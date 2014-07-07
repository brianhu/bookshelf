//
//  BookDetailTableViewController.h
//  BookShelf
//
//  Created by Rita on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface BookDetailTableViewController : UITableViewController

- (IBAction)updateBookInfo:(id)sender;

typedef NS_ENUM(NSInteger, ViewMode){
    EditMode = 0,
    NewMode = 1
};


@property (nonatomic) ViewMode viewMode;
@property (strong, nonatomic) Book *selectedBook;
@end
