//
//  AddViewController.h
//  CountDownTimeTable
//
//  Created by Hideki YAMAKADO on 11/11/14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource> {
	UITextField *eventText;
	UIPickerView *timePicker;
	
	NSFetchedResultsController *fetchedResultsController;	
}

@property(nonatomic, retain) IBOutlet UITextField *eventText;
@property(nonatomic, retain) IBOutlet UIPickerView *timePicker;
@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (void)addEvent;
- (IBAction)closeKeyboard;

@end
