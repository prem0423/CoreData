//
//  ViewController.h
//  CoreData
//
//  Created by Blaze Automation on 23/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"
#import "ListTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    ListTableViewCell *listTableViewCell;
}

- (IBAction)AddBarButtonItem:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (strong) NSArray *itemsList;

@end

