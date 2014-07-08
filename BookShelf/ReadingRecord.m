//
//  ReadingRecord.m
//  BookShelf
//
//  Created by Brian Hu on 7/8/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import "ReadingRecord.h"
#import "Book.h"


@implementation ReadingRecord

@dynamic readDate;
@dynamic readHour;
@dynamic book;

- (NSString *)readDateToString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d/M/Y"];
    return [formatter stringFromDate:self.readDate];
}
@end
