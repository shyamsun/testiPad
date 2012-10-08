//
//  listPickerController.m
//  testipad3
//
//  Created by Shyam Sundar Gavarapet Ashok on 9/11/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "listPickerController.h"

@interface listPickerController ()

@end

@implementation listPickerController
@synthesize lists, delegate;

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
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(350, 400);
    self.lists = [NSMutableArray array];
    [lists addObject:@"Tangomat watch has been added to your list"];
    [lists addObject:@"Waves Keychain has been added to your list"];
    [lists addObject:@"Lined Blazer has been added to your list"];
    [lists addObject:@"Sony Alpha Cam has been added to your list"];
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
   // UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"apple-everything.jpeg"]];
    //self.view.backgroundColor = background;
    //[background release];


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
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
    return [lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    // Configure the cell...
    NSString *color = [lists objectAtIndex:indexPath.row];
    UIView *lab = [[UIView alloc] initWithFrame:cell.frame];
    [lab setBackgroundColor:[UIColor grayColor]];
   // cell.backgroundView = lab;
    [lab release];
   // cell.textLabel.text = color;
    //cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    UILabel *nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake( 91.0, 0.0, 260.0, 44.0 )] autorelease];
    nameLabel.font = [UIFont systemFontOfSize: 13.0];
    //nameLabel.textAlignment = UITextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = color;
    nameLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    nameLabel.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview: nameLabel];
    
    
    if (indexPath.row == 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"watch75x75.png"]];
        cell.imageView.image = imageView.image;
        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        [cell.imageView.layer setBorderWidth: 3.0];
        [imageView release];
    }
    else if (indexPath.row == 1){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keychain.png"]];
        cell.imageView.image = imageView.image;
        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        [cell.imageView.layer setBorderWidth: 3.0];
        [imageView release];
    }
    else if (indexPath.row == 2){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"suit.png"]];
        cell.imageView.image = imageView.image;
        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        [cell.imageView.layer setBorderWidth: 3.0];
        [imageView release];
    }
    else if (indexPath.row == 3){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
        cell.imageView.image = imageView.image;
        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        [cell.imageView.layer setBorderWidth: 3.0];
        [imageView release];
    }
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    if (delegate != nil) {
        NSString *color = [lists objectAtIndex:indexPath.row];
        [delegate listSelected:color];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
    self.lists = nil;
    self.delegate = nil;
    [super dealloc];
}


@end
