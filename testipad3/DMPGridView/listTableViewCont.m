//
//  listTableViewCont.m
//  testipad3
//
//  Created by Shyam Sundar Gavarapet Ashok on 9/17/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "listTableViewCont.h"
#import "tableViewController.h"

@interface listTableViewCont ()

@end

@implementation listTableViewCont

@synthesize table, delegate, lists, urlImage, title2, externalArrayImage, externalArrayTitle, dragView, arrayProducts;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withImages:(NSMutableArray *)productImages{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayProducts = productImages;
    }
    return self;
}

- (id)initWithImage:(NSURL *)imageUrl withTitle:(NSString *)titler{
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        urlImage = imageUrl;
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:urlImage]];
        title2 = titler;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];        
        self.dragView = [[[UIImageView alloc] initWithImage:[imageView screenshot]] autorelease];
        self.dragView.opaque = YES;
        self.dragView.backgroundColor = self.table.backgroundColor;
        self.dragView.layer.cornerRadius = 8; // if you like rounded corners
        self.dragView.layer.shadowOffset = CGSizeMake(-5, 2);
        self.dragView.layer.shadowRadius = 5;
        self.dragView.layer.shadowOpacity = 0.5;
        self.dragView.transform = CGAffineTransformMakeScale( 0.5, 0.5 );
        self.dragView.alpha = 1;
        NSLog(@"imageurl is %@ %@", imageUrl, title2);
        
        self.externalArrayImage = [[NSMutableArray alloc] init];
        self.externalArrayTitle = [[NSMutableArray alloc] init];
        [externalArrayImage addObject:self.dragView];
        [externalArrayTitle addObject:title2];
        [self viewDidLoad];

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lists = [[NSMutableArray alloc] init];
    
    [lists addObject:@"Tangomat watch has been added to your list"];
    [lists addObject:@"Waves Keychain has been added to your list"];
    [lists addObject:@"Lined Blazer has been added to your list"];
    [lists addObject:@"Sony Alpha Cam has been added to your list"];
    
  //  arr = [lists arrayByAddingObjectsFromArray:lists];
    NSLog(@"the list array is %@", arr);
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    self.table.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
   
    
    [self.table beginUpdates];
    [self.table reloadData];
    [self.table endUpdates];

    
    // Do any additional setup after loading the view from its nib.
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
    //int count = [lists count] + [externalArrayImage count];
    int count = [self.arrayProducts count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"refreshed");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    // Configure the cell...
    UIView *lab = [[UIView alloc] initWithFrame:cell.frame];
    [lab setBackgroundColor:[UIColor grayColor]];
    // cell.backgroundView = lab;
    [lab release];
    NSString *color  = nil;
    cell.imageView.image = [self.arrayProducts objectAtIndex:indexPath.row];
    [cell.imageView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [cell.imageView.layer setBorderWidth: 3.0];
//    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2|| indexPath.row == 3) {
//        NSLog(@"in here");
//        color = [lists objectAtIndex:indexPath.row];
//    }
//    else{
//        int index = [[NSString stringWithFormat:@"%d",indexPath.row] integerValue] - 4;
//        NSLog(@"index is %d", index);
//        color = [externalArrayTitle objectAtIndex:index];
//    }
    
    // cell.textLabel.text = color;
    //cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    UILabel *nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake( 110.0, 0.0, 260.0, 44.0 )] autorelease];
    nameLabel.font = [UIFont systemFontOfSize: 13.0];
    //nameLabel.textAlignment = UITextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"Product Name 50% off";
    nameLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    nameLabel.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview: nameLabel];

//    if (indexPath.row == 0) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"watch75x75.png"]];
//        cell.imageView.image = imageView.image;
//        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//        [cell.imageView.layer setBorderWidth: 3.0];
//        [imageView release];
//    }
//    else if (indexPath.row == 1){
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keychain.png"]];
//        cell.imageView.image = imageView.image;
//        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//        [cell.imageView.layer setBorderWidth: 3.0];
//        [imageView release];
//    }
//    else if (indexPath.row == 2){
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"suit.png"]];
//        cell.imageView.image = imageView.image;
//        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//        [cell.imageView.layer setBorderWidth: 3.0];
//        [imageView release];
//    }
//    else if (indexPath.row == 3){
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
//        cell.imageView.image = imageView.image;
//        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//        [cell.imageView.layer setBorderWidth: 3.0];
//        [imageView release];
//    }
//    else{
////        int index = [[NSString stringWithFormat:@"%d",indexPath.row] integerValue] - 4;
////        UIImageView *imageView = [externalArrayImage objectAtIndex:index];
////        NSLog(@"index is %@", imageView.image);
////        cell.imageView.image = imageView.image;
////        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
////        [cell.imageView.layer setBorderWidth: 3.0];
////        [imageView release];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
//        cell.imageView.image = imageView.image;
//        [cell.imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//        [cell.imageView.layer setBorderWidth: 3.0];
//        [imageView release];
//    }
    
    
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)lisButtonPress:(id)sender{
     
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.75];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:YES];
    [UIView commitAnimations];
    [self.navigationController popViewControllerAnimated:NO];
}

@end

@implementation UIView (Adicioness)

- (UIImage *) screenshot {
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = self.bounds.size;
    NSLog(@"am i in this?? %@", NSStringFromCGSize(imageSize));
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	[self.layer renderInContext:context];
    
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
    return image;
}

@end
