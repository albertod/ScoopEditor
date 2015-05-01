//
//  ADMAuthorNewsTableViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMAuthorNewsTableViewController.h"
#import "ADMNew.h"
@interface ADMAuthorNewsTableViewController ()

@property (strong,nonatomic) NSArray *publicatedNews;
@property (strong,nonatomic) NSArray *nonPublicatedNews;

@end



@implementation ADMAuthorNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setContentInset:UIEdgeInsetsMake(20,0,0,0)];
    self.title = @"Scoop News";
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
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:@"titleText" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:brandDescriptor];

    
    PFQuery *query = [PFQuery queryWithClassName:@"ADMNew"];
    if(section == PUBLICATED_SECTION){
        [query whereKey:@"publicated" equalTo:@"Publicated"];
        _publicatedNews = [query findObjects];
        _publicatedNews = [_publicatedNews sortedArrayUsingDescriptors:sortDescriptors];
        return _publicatedNews.count;
    }else{
        [query whereKey:@"publicated" equalTo:@"No-Publicated"];
        _nonPublicatedNews = [query findObjects];
        _nonPublicatedNews = [_nonPublicatedNews  sortedArrayUsingDescriptors:sortDescriptors];
        return _nonPublicatedNews.count;
    }
    
    
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ADMNew *news = nil;
    if(indexPath.section == PUBLICATED_SECTION){
        news = [_publicatedNews objectAtIndex:indexPath.row];
    }else{
        news = [_nonPublicatedNews objectAtIndex:indexPath.row];
    }
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = news.titleText;
    //cell.imageView.image = ;
    cell.detailTextLabel.text = news.publicated;
    //Rating
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    if(section == PUBLICATED_SECTION){
        return @"Publicated News";
    }else{
        return @"News in review";
    }
}

@end
