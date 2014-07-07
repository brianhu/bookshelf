//
//  Book.h
//  BookShelf
//
//  Created by Brian Hu on 7/7/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSNumber * bookID;
@property (nonatomic, retain) NSString * bookName;
@property (nonatomic, retain) NSDate * buyDate;
@property (nonatomic, retain) NSNumber * buyPrice;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
