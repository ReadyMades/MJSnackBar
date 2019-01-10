//
//  ExampleViewController.m
//  MJSnackBar_Example
//
//  Created by dev on 10/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

#import "ExampleViewController.h"
#import "MJSnackBar_Example-Swift.h"

@interface ExampleViewController () <UITableViewDataSource, UITableViewDelegate, MJSnackBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *exampleTableView;
@property (strong, nonatomic) MJSnackBar *snackBar;
@property (strong, nonatomic) NSMutableArray<NSString*> *dataArray;
@end

@implementation ExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"Walk the Dog",@"Take a shower",@"Clean house",@"Shopping"]];
    _snackBar = [[MJSnackBar alloc] initOnView:self.view];
    _snackBar.delegate = self;
    _snackBar.width = 340;
    _snackBar.leftSideMargins = 24;
    _snackBar.needAligmentX = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
    _snackBar.layer.cornerRadius = 8;
    _snackBar.bottomMargin = 72;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [UITableViewCell new];
    tableViewCell.textLabel.text = self.dataArray[indexPath.row];
    return tableViewCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *message = [NSString stringWithFormat:@"Deleted: %@",self.dataArray[indexPath.row]];
        MJSnackBarData *data = [[MJSnackBarData alloc] initWithIdentifier:@(indexPath.row) message:message andActionMessage:@"UNDO" objectSaved:self.dataArray[indexPath.row]];
        [self.snackBar showWithData:data onView:self.view];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)snackBarAppearedWith:(MJSnackBarData *)data
{
    NSLog(@"⭐ SnackBar appeared %@",data.message);
    
}

- (void)snackBarActionTriggeredWith:(MJSnackBarData *)data
{
    NSLog(@"👆 SnackBar touched %@",data.message);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:data.identifier.integerValue inSection:0];
    
    NSString *originaldata = (NSString*)data.originalObject;
    if ([originaldata isKindOfClass:[NSString class]])
    {
        [self.dataArray insertObject:originaldata atIndex:indexPath.row];
        [self.exampleTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)snackBarDisappearedWith:(MJSnackBarData *)data reason:(NSInteger)reason
{
    NSLog(@"⭐ SnackBar appeared %@ - Reason: %d",data.message,(int)reason);
}

@end
