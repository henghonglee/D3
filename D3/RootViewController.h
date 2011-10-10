//
//  RootViewController.h
//  D3
//
//  Created by Shaun Tan on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabarianViewController.h"
#import "DemonHunterViewController.h"
#import "WitchDoctorViewController.h"
#import "MonkViewController.h"
#import "WizardViewController.h"
#import <CoreData/CoreData.h>

@interface RootViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
-(IBAction)showBBR:(id)sender;
-(IBAction)showWD:(id)sender;
-(IBAction)showDH:(id)sender;
-(IBAction)showWZ:(id)sender;
-(IBAction)showMK:(id)sender;
@end
