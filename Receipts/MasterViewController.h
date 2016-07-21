//
//  MasterViewController.h
//  Receipts
//
//  Created by Yana Kultysheva on 2016-07-21.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

