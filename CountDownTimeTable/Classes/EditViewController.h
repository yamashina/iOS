//
//  EditViewController.h
//  CountDownTimeTable
//
//  Created by Hideki YAMAKADO on 11/11/14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource> {
	UITextField *eventText;
	UIPickerView *timePicker;
	
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObject *selectedObject;
}

@property(nonatomic, retain) IBOutlet UITextField *eventText;
@property(nonatomic, retain) IBOutlet UIPickerView *timePicker;
@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, retain) NSManagedObject *selectedObject;

- (void)editEvent;
- (IBAction)closeKeyboard;

@end
