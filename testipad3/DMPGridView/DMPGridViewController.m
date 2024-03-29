//
//  DMPGridViewController.m
//  DMPGridViewController
//
//  Created by David Patierno on 11/7/11.
//  Copyright (c) 2011. All rights reserved.
//

#import "DMPGridViewController.h"
#import "DMPGridViewCell.h"
#import "dealObject.h"

@implementation DMPGridViewController

@synthesize delegate = _delegate;

- (id)initWithDelegate:(id<DMPGridViewDelegate>)delegate {
    if ((self = [super init])) {
        self.delegate = delegate;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [super viewDidLoad];

}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.tableView reloadData];
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
    NSInteger numberOfCells = [_delegate numberOfCellsForGridViewController:self];
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

    // Configure the cell...
    NSUInteger offset = 0;
    for (NSUInteger i=0; i<indexPath.row; i++)
        offset += [DMPGridViewCell cellsPerRowForStyle:[self styleForRow:i]];
    
    NSInteger numberOfCells = [_delegate numberOfCellsForGridViewController:self];
    NSLog(@"number2 is %d", numberOfCells);

    for (NSUInteger i=0; i<[DMPGridViewCell cellsPerRowForStyle:style]; i++) {
        if (offset + i >= numberOfCells)
            break;
        
        DMPGridViewCell *gridCell = [[DMPGridViewCell alloc] initWithStyle:style index:i];
        
        // Image
        
        dispatch_queue_t imageDownloadQ = dispatch_queue_create("testIpad image downloader", NULL);
        dispatch_async(imageDownloadQ, ^{
            NSURL *imageURL = [_delegate gridViewController:self imageForCellAtIndex:offset + i];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
            // ... todo fix
            dispatch_async(dispatch_get_main_queue(), ^{
                [gridCell.imageView setImage:image];
            });
        });
        dispatch_release(imageDownloadQ);

        //UIImage *image = [_delegate gridViewController:self imageForCellAtIndex:offset + i]; // ... todo fix
       // [gridCell.imageView setImage:image];
        
        // Title
        NSString *text = [_delegate gridViewController:self titleForCellAtIndex:offset + i]; // ... todo fix
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
    dealObject *dealOb;
    NSLog(@"tag is %d", gestureRecognizer.view.tag);
    dealOb = [_delegate gridViewController:self tappedCellAtIndex:gestureRecognizer.view.tag];
    NSLog(@"");

}


@end
