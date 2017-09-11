//
//  CoreDataModel.m
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import "CoreDataModel.h"

@implementation CoreDataModel

+ (void)addItemWithItem:(NSString *)itemString
        itemDescription:(NSString *)itemDescriptionString
          purchasedDate:(NSString *)deviceNameString
               quantity:(NSString *)quantityString
                   cost:(NSString *)costString {
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.item == %@", itemString];
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }
    NSManagedObject *deviceManageObject = [[context executeFetchRequest:fetchRequest error:nil] lastObject];
    if (!deviceManageObject) {
        deviceManageObject = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:context];
    }
    NSNumber *number = [NSNumber numberWithFloat:[costString floatValue]];
    [deviceManageObject setValue:number forKey:kCostKey];
    [deviceManageObject setValue:itemString forKey:kItemKey];
    [deviceManageObject setValue:itemDescriptionString forKey:kItemDescriptionKey];
    [deviceManageObject setValue:[NSDate date] forKey:kPurchasedDateKey];
    NSNumber *quantityNumber = [NSNumber numberWithInt:[quantityString intValue]];
    [deviceManageObject setValue:quantityNumber forKey:kQuantityKey];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    else {
        NSLog(@"Saved Data");
    }
    
}
+ (NSArray *)getAllItems {
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.%@ == %@ AND (NOT (SELF.%@ == %@)) AND (NOT (SELF.%@ IN %@)) AND (SELF.%@ IN %@)",
//                              kHubIDKey, hubIDString, kDeviceBOneIDKey, kSecurityDeviceBOneID, kCategoryIDKey, excludeCategoryIDList, kParentCategoryNameKey, includeParentCategoryNamesList];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
//    if (predicate) {
//        [fetchRequest setPredicate:predicate];
//    }
    NSArray *deviceList = [context executeFetchRequest:fetchRequest error:nil];
    
//    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:kPurchasedDateKey ascending:YES selector:@selector(caseInsensitiveCompare:)];
//    NSArray *deviceListAscendingOrder = [[deviceList filteredArrayUsingPredicate:predicate]
//                                         sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    
    return deviceList;
}

@end
