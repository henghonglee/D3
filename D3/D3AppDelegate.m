//
//  D3AppDelegate.m
//  D3
//
//  Created by Shaun Tan on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "D3AppDelegate.h"
#import "RootViewController.h"
#import "BGViewController.h"

@implementation D3AppDelegate
@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:nil];
  
    
    
    
    
    NSString *mp4Path = [[NSBundle mainBundle] pathForResource:@"iphone1" ofType:@"m4v"];
    NSURL *url = [NSURL fileURLWithPath:mp4Path];
    player = [[MPMoviePlayerController alloc] initWithContentURL: url];
    player.controlStyle = MPMovieControlStyleNone;  
    player.scalingMode = MPMovieScalingModeAspectFit;
    [player.view setFrame: self.window.bounds];  // player's frame must match parent'
    [self.window addSubview: player.view];
    [player play];   
    [self.window makeKeyAndVisible];
    return YES;
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    
    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {
        [moviePlayer.view removeFromSuperview];
        self.window.rootViewController = self.navigationController;
       
        RootViewController *modalController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
        modalController.managedObjectContext = self.managedObjectContext;
        [self.navigationController pushViewController:modalController animated:NO];
        self.navigationController.navigationBarHidden = YES;
        modalController.view.alpha = 0.0;
        // [self.window.rootViewController presentModalViewController:modalController animated:NO];
        [UIView animateWithDuration:1.0
                         animations:^{modalController.view.alpha = 1.0;}];
        [modalController release];

           }
    
    [moviePlayer release];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [_navigationController release];

    [super dealloc];
}



- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
     
     if (__persistentStoreCoordinator != nil) {
         return __persistentStoreCoordinator;
     }
     
     NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"Diablo3.sqlite"];
     
     // Set up the store.
     // For the sake of illustration, provide a pre-populated default store.
    
     NSFileManager *fileManager = [NSFileManager defaultManager];
     // If the expected store doesn't exist, copy the default store.
     if (![fileManager fileExistsAtPath:storePath]) {
         NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"Diablo3" ofType:@"sqlite"];
         if (defaultStorePath) {
             [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
         }
     }
	 
     NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
     
     NSError *error;
     __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
     if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
         /*
          Replace this implementation with code to handle the error appropriately.
          
          abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
          
          Typical reasons for an error here include:
          * The persistent store is not accessible
          * The schema for the persistent store is incompatible with current managed object model
          Check the error message to determine what the actual problem was.
          */
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                             message:@"Error with Database, please reinstall application"
                                                            delegate:self cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
         [alertView show];
         if (alertView) {
             [alertView release];
         }
         
         NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
         abort();
     }    
     
     return __persistentStoreCoordinator;
 }


#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
