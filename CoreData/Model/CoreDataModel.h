//
//  CoreDataModel.h
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataModel : NSObject

+ (void)addItemWithItem:(NSString *)itemString
        itemDescription:(NSString *)itemDescriptionString
          purchasedDate:(NSString *)deviceNameString
               quantity:(NSString *)quantityString
                   cost:(NSString *)costString;
+ (NSArray *)getAllItems;

@end
