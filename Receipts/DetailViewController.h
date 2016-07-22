//
//  DetailViewController.h
//  Receipts
//
//  Created by Yana Kultysheva on 2016-07-21.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextField *enterPrice;
@property (weak, nonatomic) IBOutlet UITextField *enterNote;
@property (weak, nonatomic) IBOutlet UIDatePicker *chooseDate;

@property (strong, nonatomic) IBOutlet UIView *cancelEntry;
@property (weak, nonatomic) IBOutlet UIButton *createEntry;
@property (weak, nonatomic) IBOutlet UITableView *tagTable;

//- (void)createEntityForName:(NSString *)name info:(NSDictionary *)info;
- (NSManagedObject *)createEntityForName:(NSString *)name info:(NSDictionary *)info;


@end

