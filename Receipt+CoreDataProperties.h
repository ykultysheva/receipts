//
//  Receipt+CoreDataProperties.h
//  Receipts
//
//  Created by Yana Kultysheva on 2016-07-21.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSString *amount;
@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *tags;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addTagsObject:(NSManagedObject *)value;
- (void)removeTagsObject:(NSManagedObject *)value;
- (void)addTags:(NSSet<NSManagedObject *> *)values;
- (void)removeTags:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
