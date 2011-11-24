//
//  AddViewController.m
//  CountDownTimeTable
//
//  Created by Hideki YAMAKADO on 11/11/14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"
#import "CountDownTimeTableAppDelegate.h"


@implementation AddViewController

@synthesize eventText;
@synthesize timePicker;
@synthesize fetchedResultsController;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
																			   target:self 
																			   action:@selector(addEvent)];
	//    addButton.enabled = NO;
	self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
	
	// ナビゲーションバータイトル
	CountDownTimeTableAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	AddViewController *viewController = (AddViewController *)appDelegate.navigationController.topViewController;
	viewController.title = @"Add Event";
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[eventText release];
	[timePicker release];
	[fetchedResultsController release];
	
    [super dealloc];
}


- (void)addEvent {
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
	[newManagedObject setValue:eventText.text forKey:@"name"];
	
	int hour = [timePicker selectedRowInComponent:0];
	int minute = [timePicker selectedRowInComponent:1];
	
	NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
	[dateComponent setYear:2000];
	[dateComponent setMonth:1];
	[dateComponent setDay:1];
	[dateComponent setHour:hour];
	[dateComponent setMinute:minute];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	[newManagedObject setValue:[calendar dateFromComponents:dateComponent] forKey:@"time"];
	[dateComponent release];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
	
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)closeKeyboard {
	[eventText resignFirstResponder];
}


// === UIPickerViewDataSource ===
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if (component == 0) {
		return 24;
	}
	else if (component == 1) {
		return 60;
	}
	
	// error case
	return 0;
}


// === UIPickerViewDelegate ===
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	//	return @"test";
	return [NSString stringWithFormat:@"%02d", row];
}


@end
