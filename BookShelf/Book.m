//
//  Book.m
//  BookShelf
//
//  Created by Brian Hu on 7/7/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import "Book.h"


@implementation Book

@dynamic bookName;
@dynamic buyDate;
@dynamic buyPrice;
@dynamic records;

- (NSString *)buyDateToString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d/M/Y"];
    return [formatter stringFromDate:self.buyDate];
}
@end
