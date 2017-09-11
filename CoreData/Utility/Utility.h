//
//  Utility.h
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface Utility : NSObject

+ (UIViewController *)getViewControllerWithStoryboardName:(NSString *)storyboardNameString storyboardID:(NSString *)storyboardIDString;

@end
