//
//  Utility.m
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (UIViewController *)getViewControllerWithStoryboardName:(NSString *)storyboardNameString storyboardID:(NSString *)storyboardIDString {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:storyboardNameString bundle: nil];
    UIViewController *viewController = (UIViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: storyboardIDString];
    return viewController;
}

@end
