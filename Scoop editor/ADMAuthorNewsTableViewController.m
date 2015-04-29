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

@end

NSArray *publicatedNews;
NSArray *nonPublicatedNews;

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
        publicatedNews = [query findObjects];
        publicatedNews = [publicatedNews sortedArrayUsingDescriptors:sortDescriptors];
        return publicatedNews.count;
    }else{
        [query whereKey:@"publicated" equalTo:@"No-Publicated"];
        nonPublicatedNews = [query findObjects];
        nonPublicatedNews = [nonPublicatedNews  sortedArrayUsingDescriptors:sortDescriptors];
        return nonPublicatedNews.count;
    }
    
    
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ADMNew *news = nil;
    if(indexPath.section == PUBLICATED_SECTION){
        news = [publicatedNews objectAtIndex:indexPath.row];
    }else{
        news = [nonPublicatedNews objectAtIndex:indexPath.row];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
