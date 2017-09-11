//
//  AddViewController.h
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataModel.h"

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *quantityTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalCostTextField;
- (IBAction)AddItamButtonAction:(id)sender;

@property (strong) NSManagedObject *managedObject;

@end
