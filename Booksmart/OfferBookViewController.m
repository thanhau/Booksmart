//
//  OfferBookViewController.m
//  Booksmart
//
//  Created by Thanh Au on 7/25/13.
//  Copyright (c) 2013 Lam Lu. All rights reserved.
//

#import "OfferBookViewController.h"

@interface OfferBookViewController ()

@end

@implementation OfferBookViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    ListOfTradingBookConnection *connection = [[ListOfTradingBookConnection alloc]init];
    [connection createConnection:[WTTSingleton sharedManager].userprofile.email];
    connection.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if ([listOfBook count] != 0)
    {
        return [listOfBook count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if ([listOfBook count] != 0 )
    {
        /*
        UILabel* nameLabel = (UILabel *) [cell viewWithTag:2];
        Book *book = [listOfBook objectAtIndex:indexPath.row];
        NSString *name = [book bookTitle];
        NSLog(@"name = %@", name);
        nameLabel.text = name;
        */
        UILabel* nameLabel = (UILabel *) [cell viewWithTag:1];
        Book *book = [listOfBook objectAtIndex:indexPath.row];
        NSString *name = [book bookTitle];
        nameLabel.text = name;
        
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


// Receive list of book from server
- (void) finished{
    NSLog(@"teeeeeeeee");
    listOfBook = [WTTSingleton sharedManager].json;
    NSLog(@"%@",listOfBook);
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}
- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
