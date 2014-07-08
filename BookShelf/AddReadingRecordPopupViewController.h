//
//  AddReadingRecordPopupViewController.h
//  BookShelf
//
//  Created by Brian Hu on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddReadingRecordPopupViewDelegate <NSObject>
- (void)dataSubmitted:(NSDate *)date hour:(NSInteger)hour;
@end

@interface AddReadingRecordPopupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *hourField;

- (IBAction)submit:(id)sender;
@property (nonatomic, assign) id <AddReadingRecordPopupViewDelegate> delegate;
@end
