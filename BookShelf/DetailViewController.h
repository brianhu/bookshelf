//
//  DetailViewController.h
//  BookShelf
//
//  Created by Brian Hu on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
