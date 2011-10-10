//
//  RootViewController.m
//  D3
//
//  Created by Shaun Tan on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Skill.h"
@implementation RootViewController
@synthesize managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [managedObjectContext save:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

-(IBAction)showBBR:(id)sender{
    NSLog(@"show bbr");
    NSLog(@"%@",self.navigationController);
    BabarianViewController *viewController = [[BabarianViewController alloc]initWithNibName:@"BabarianViewController" bundle:nil];
    viewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release]; 
}
-(IBAction)showWD:(id)sender{
    WitchDoctorViewController *viewController = [[WitchDoctorViewController alloc]initWithNibName:@"WitchDoctorViewController" bundle:nil];
    viewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release]; 
}
-(IBAction)showDH:(id)sender{
    DemonHunterViewController *viewController = [[DemonHunterViewController alloc]initWithNibName:@"DemonHunterViewController" bundle:nil];
    viewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];    
}
-(IBAction)showWZ:(id)sender{
    WizardViewController *viewController = [[WizardViewController alloc]initWithNibName:@"WizardViewController" bundle:nil];
    viewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release]; 
}
-(IBAction)showMK:(id)sender{
    MonkViewController *viewController = [[MonkViewController alloc]initWithNibName:@"MonkViewController" bundle:nil];
    viewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release]; 
}
@end
