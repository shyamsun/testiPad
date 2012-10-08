//
//  LocalAdsTableViewViewController.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/6/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "LocalAdsTableViewViewController.h"
#import "testUtils.h"
#import "DMPGridViewCell.h"
#import "localAdsObject.h"
#import "ProductDescriptionViewController.h"
#import "UIViewController+MJPopupViewController.h"

@interface LocalAdsTableViewViewController ()

@end

@implementation LocalAdsTableViewViewController

@synthesize table, list;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self tableFeatures];
    list = [[NSMutableArray alloc] init];
    self.list = [testUtils httpCallJsonLocalAd:@"http://100702.demo.findnsave.com/api/localads.json"];
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.list = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) tableFeatures{
    
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor clearColor];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"apple-everything.jpeg"]];
    self.view.backgroundColor = background;
    [background release];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1f];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.table reloadData];
}

#pragma mark - Table view data source

- (DMPGridViewCellStyle)styleForRow:(NSUInteger)row {
    DMPGridViewCellStyle style;
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        style = (row + 1) % 4;
    }
    else {
        style = (row + 1) % 3 + 4;
    }
    return style;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfCells = [self.list count];
    NSLog(@"number is %d", numberOfCells);
    NSUInteger rows = 0;
    for (int i=0; numberOfCells>0; i++) {
        numberOfCells -= [DMPGridViewCell cellsPerRowForStyle:[self styleForRow:i]];
        rows++;
    }
    return rows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 235.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Choose a row style.
    
    DMPGridViewCellStyle style = [self styleForRow:indexPath.row];
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d", style];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        // Remove any existing DMPGridViewCells since we don't reuse them.
        for (UIView *v in cell.contentView.subviews)
            [v removeFromSuperview];
    }
    NSUInteger offset = 0;
    for (NSUInteger i=0; i<indexPath.row; i++)
        offset += [DMPGridViewCell cellsPerRowForStyle:[self styleForRow:i]];
    
    NSInteger numberOfCells = [self.list count];
    
    for (NSUInteger i=0; i<[DMPGridViewCell cellsPerRowForStyle:style]; i++) {
        if (offset + i >= numberOfCells)
            break;
        
        DMPGridViewCell *gridCell = [[DMPGridViewCell alloc] initWithStyle:style index:i];
        
        // Image
        
        dispatch_queue_t imageDownloadQ = dispatch_queue_create("testIpad image downloader", NULL);
        dispatch_async(imageDownloadQ, ^{
            localAdsObject *localAd = [self.list objectAtIndex:(offset + i)];
            NSURL *imageURL = localAd.imageUrl;
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
            // ... todo fix
            dispatch_async(dispatch_get_main_queue(), ^{
                [gridCell.imageView setImage:image];
            });
        });
        dispatch_release(imageDownloadQ);
        
        // Title
        localAdsObject *localAd = [self.list objectAtIndex:(offset + i)];
        NSString *text = [NSString stringWithFormat:@"%@", localAd.advName]; // ... todo fix
        [gridCell.textLabel setText:text];
        
        // Handle taps.
        gridCell.tag = offset + i;
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        g.numberOfTapsRequired = 1;
        g.numberOfTouchesRequired = 1;
        [gridCell addGestureRecognizer:g];
        [g release];
        
        [cell.contentView addSubview:gridCell];
        [gridCell release];
    }
    
    
    return cell;
}


- (void)tap:(UIGestureRecognizer *)gestureRecognizer {
    localAdsObject *localAd = [self.list objectAtIndex:gestureRecognizer.view.tag];
    ProductDescriptionViewController *product = [[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:localAd.imageUrl withTitle:localAd.advName withPrice:nil bundle:nil];
    [self presentPopupViewController:product animationType:MJPopupViewAnimationSlideBottomBottom];
    [UIView commitAnimations];
    NSLog(@"tag is %d", gestureRecognizer.view.tag);
}



@end
