//
//  ADMNewsReaderTableViewController.m
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/29/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNewsReaderTableViewController.h"
#import "ADMNew.h"
#import <Parse/Parse.h>
#import "ADMReaderViewController.h"



@interface ADMNewsReaderTableViewController ()
@property (strong,nonatomic) NSArray *publicatedNews;
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
    _publicatedNews = [query findObjects];
    _publicatedNews = [_publicatedNews sortedArrayUsingDescriptors:sortDescriptors];
    return _publicatedNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ADMNew *news = nil;
    news = [_publicatedNews objectAtIndex:indexPath.row];

    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = news.titleText;
    //cell.imageView.image = ;
    cell.detailTextLabel.text = news.author;
    //Rating
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
        return @"Publicated News";
}


//Delegate
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ADMNew *news = [_publicatedNews objectAtIndex:indexPath.row];
    ADMReaderViewController *readerVC = [[ADMReaderViewController alloc] initWithmodel:news];
    [self.navigationController pushViewController:readerVC animated:YES];
    
    
}


@end
