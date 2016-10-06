//
//  MasterViewController.h
//  Contatos
//
//  Created by Hugo Schneider on 8/25/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(IBAction)unwindToMaster:(UIStoryboardSegue *)segue;

@end

