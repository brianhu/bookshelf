//
//  ReadingRecord.h
//  BookShelf
//
//  Created by Brian Hu on 7/8/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface ReadingRecord : NSManagedObject

@property (nonatomic, retain) NSDate * readDate;
@property (nonatomic, retain) NSNumber * readHour;
@property (nonatomic, retain) Book *book;

- (NSString *)readDateToString;
@end
