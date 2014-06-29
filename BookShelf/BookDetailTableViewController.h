//
//  BookDetailTableViewController.h
//  BookShelf
//
//  Created by Rita on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BookDetailTableViewController : UITableViewController

typedef NS_ENUM(NSInteger, DetailMode){
    EditMode = 0,
    ViewMode = 1
};

@property (nonatomic) DetailMode detailMode;


@end
