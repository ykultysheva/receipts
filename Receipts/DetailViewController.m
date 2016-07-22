//
//  DetailViewController.m
//  Receipts
//
//  Created by Yana Kultysheva on 2016-07-21.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "Receipt.h"
#import "Tag.h"
#import "AppDelegate.h"
#import "DetailedCell.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (nonatomic, strong) Receipt *receipt;
@property (nonatomic, strong) AppDelegate *delegate;


@property NSArray* tagNames;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.receipt = (Receipt *)[self.delegate createEntityForName:(NSString *)@"Receipt" info:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    
    self.tagTable.allowsMultipleSelection = YES;
    
    self.tagNames = @[@"Personal", @"Business", @"Family"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TableView ------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return [[self.fetchedResultsController sections] count];
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
//    return [sectionInfo numberOfObjects];
    return self.tagNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailedCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    NSString *tagName = self.tagNames[indexPath.row];
    
    cell.chooseTag.text = tagName;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tagName = self.tagNames[indexPath.row];
    
    Tag *tag = (Tag *)[self.delegate createEntityForName:(NSString *)@"Tag" info:(NSDictionary *)@{@"tagName" : tagName}];
    
    [self.receipt addTagsObject:tag];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
//        
//        NSError *error = nil;
//        if (![context save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    cell.textLabel.text = [[object valueForKey:@"timeStamp"] description];
}


- (void)setupTextField {
    self.enterPrice.delegate = self;
    self.enterNote.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.enterPrice isFirstResponder]) {
        [self.enterPrice resignFirstResponder];
    } else if ([self.enterNote isFirstResponder]) {
        [self.enterNote resignFirstResponder];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)createRecord:(id)sender {
    
    self.receipt.amount = self.enterPrice.text;
    self.receipt.note = self.enterNote.text;
    
    [self.delegate.managedObjectContext save:nil];
}

//- (NSArray *)createTagsFromIndexPaths:(NSArray *)paths {
//    
//}

- (IBAction)cancelRecord:(id)sender {
}


@end
