//
//  ViewController.m
//  CoreData
//
//  Created by Blaze Automation on 23/08/17.
//  Copyright © 2017 Blaze Automation. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_listTableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:(1/255.0f) green:(132/255.0f) blue:(195/255.0f) alpha:1.0f];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CoreDataModel getAllItems].count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"reportTableViewCellIdentifier";
    listTableViewCell = (ListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (listTableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        listTableViewCell = [nib objectAtIndex:0];
    }
    NSManagedObject *deviceManageObject = [[CoreDataModel getAllItems] objectAtIndex:indexPath.row];
    listTableViewCell.titleLabel.text = [deviceManageObject valueForKey:@"item"];
    return listTableViewCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddViewController  *vc = (AddViewController *)[Utility getViewControllerWithStoryboardName:@"Main" storyboardID:@"AddViewController"];
    vc.managedObject = [[CoreDataModel getAllItems] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AddBarButtonItem:(id)sender {
    AddViewController  *vc = (AddViewController *)[Utility getViewControllerWithStoryboardName:@"Main" storyboardID:@"AddViewController"];    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
