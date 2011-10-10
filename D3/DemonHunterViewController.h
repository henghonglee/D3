//
//  DemonHunterViewController.h
//  D3
//
//  Created by Shaun Tan on 7/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
@interface DemonHunterViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>
{
    IBOutlet UITableView* dhtableView;
    NSArray* SkillsArray;
}
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
-(IBAction)Back:(id)sender;

@end
