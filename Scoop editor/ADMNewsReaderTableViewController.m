//
//  ADMNewsReaderTableViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNewsReaderTableViewController.h"
#import <Parse/Parse.h>

NSArray *publicatedNews;

@interface ADMNewsReaderTableViewController ()

@end

@implementation ADMNewsReaderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"Scoops News";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:@"titleText" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:brandDescriptor];
    PFQuery *query = [PFQuery queryWithClassName:@"ADMNew"];
    [query whereKey:@"publicated" equalTo:@"Publicated"];
    publicatedNews = [query findObjects];
    publicatedNews = [publicatedNews sortedArrayUsingDescriptors:sortDescriptors];
    return publicatedNews.count;
}

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
        return @"Publicated News";
}



@end
