//
//  RootViewController.h
//  CountDownTimeTable
//
//  Created by Hideki YAMAKADO on 11/11/14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AddViewController.h"
#import "EditViewController.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSIndexPath *targetPath;
@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSIndexPath *targetPath;

- (void)moveToAddView;
- (void)moveToEditView:(NSManagedObject *)selectedObject;

- (int)getHourFromDate:(NSDate *)date;
- (int)getMinuteFromDate:(NSDate *)date;
- (int)getSecondFromDate:(NSDate *)date;

- (void)decideTargetEvent;

@end
