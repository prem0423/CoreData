//
//  AddViewController.m
//  CoreData
//
//  Created by Blaze Automation on 24/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_managedObject) {
        _itemTextField.text = [_managedObject valueForKey:kItemKey];
        _itemDescriptionTextField.text = [_managedObject valueForKey:kItemDescriptionKey];
        _quantityTextField.text = [NSString stringWithFormat:@"%d", [[_managedObject valueForKey:kQuantityKey] intValue]];
        _totalCostTextField.text = [NSString stringWithFormat:@"%f", [[_managedObject valueForKey:kCostKey] floatValue]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)AddItamButtonAction:(id)sender {
    if ([self PerformValidation]) {
        [CoreDataModel addItemWithItem:_itemTextField.text itemDescription:_itemDescriptionTextField.text purchasedDate:@"" quantity:_quantityTextField.text cost:_totalCostTextField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)PerformValidation {
    if (_itemTextField.text.length < 1) {
        return NO;
    }
    if (_quantityTextField.text.length < 1) {
        return NO;
    }
    if (_totalCostTextField.text.length < 1) {
        return NO;
    }
    return YES;
}
@end
