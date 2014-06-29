//
//  BookInfoCell.h
//  BookShelf
//
//  Created by Rita on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellKey;
@property (weak, nonatomic) IBOutlet UITextField *cellValue;

- (void)setInfo:(NSString *)key value:(NSString *)value mode:(NSInteger)mode;

@end
