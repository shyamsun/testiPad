//
//  tableViewController.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/4/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "tableViewController.h"
#import "DMPGridViewCell.h"
#import "testUtils.h"
#import "UIViewController+MJPopupViewController.h"
#import "couponsAdsObject.h"
#import "localAdsObject.h"
#import "IIViewDeckController.h"
#import "listTableViewCont.h"
#import "AZGenieView.h"

@interface tableViewController ()

@end

@implementation tableViewController

@synthesize table, list, typeOfAd, listPicker, images, redBadgeLong, redBadgeRound, counter, imagesList, productsToBeSent;
@synthesize colorPickerPopover = _colorPickerPopover;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withType:(NSString *)type
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.typeOfAd = type;
        [self.table reloadData];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self tableFeatures];
    
    self.redBadgeLong.hidden = YES;
    self.redBadgeRound.hidden = YES;
    self.counter.hidden = YES;
    //overlay *overlay = [overlay initWithFrame:CGRectMake(0, 0, 300, 300)];]]
    
    self.productsToBeSent = [[NSMutableArray alloc] init];
    
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *image5 = [UIImage imageNamed:@"5.jpg"];
    UIImage *image6 = [UIImage imageNamed:@"6.jpg"];
    UIImage *image7 = [UIImage imageNamed:@"7.jpg"];
    UIImage *image8 = [UIImage imageNamed:@"8.jpg"];
    UIImage *image9 = [UIImage imageNamed:@"9.jpg"];
    UIImage *image10 = [UIImage imageNamed:@"10.jpg"];
    UIImage *image11 = [UIImage imageNamed:@"11.jpg"];
    UIImage *image12 = [UIImage imageNamed:@"12.jpg"];
    UIImage *image13 = [UIImage imageNamed:@"13.jpg"];
    UIImage *image14 = [UIImage imageNamed:@"14.jpg"];
    UIImage *image15 = [UIImage imageNamed:@"15.jpg"];
    UIImage *image16 = [UIImage imageNamed:@"16.jpg"];
    UIImage *image17 = [UIImage imageNamed:@"17.jpg"];
    UIImage *image18 = [UIImage imageNamed:@"18.jpg"];
    UIImage *image19 = [UIImage imageNamed:@"19.jpg"];
    UIImage *image20 = [UIImage imageNamed:@"20.jpg"];
    UIImage *image21 = [UIImage imageNamed:@"21.jpg"];
    UIImage *image22 = [UIImage imageNamed:@"22.jpg"];
    UIImage *image23 = [UIImage imageNamed:@"23.jpg"];
    UIImage *image24 = [UIImage imageNamed:@"24.jpg"];
    UIImage *image25 = [UIImage imageNamed:@"25.jpg"];
    UIImage *image26 = [UIImage imageNamed:@"26.jpg"];
    UIImage *image27 = [UIImage imageNamed:@"27.jpg"];
    UIImage *image28 = [UIImage imageNamed:@"28.jpg"];
    UIImage *image29 = [UIImage imageNamed:@"29.jpg"];
    UIImage *image30 = [UIImage imageNamed:@"30.jpg"];
    UIImage *image31 = [UIImage imageNamed:@"31.jpg"];
    UIImage *image32 = [UIImage imageNamed:@"32.jpg"];
    UIImage *image33 = [UIImage imageNamed:@"33.jpg"];
    UIImage *image34 = [UIImage imageNamed:@"34.png"];
    UIImage *image35 = [UIImage imageNamed:@"35.png"];

    imagesList = [[NSArray alloc] initWithObjects:image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21,image22,image23,image24,image25,image26,image27,image28,image29,image30,image31,image32,image33,image34,image35, nil];
    
    
     
    list = [[NSMutableArray alloc] init];
    images = [[NSMutableArray alloc] init];
    
    if ([self.typeOfAd isEqualToString:@"dailyDeal"]) {
        self.list = [testUtils httpCallJsonDeal:@"http://100702.demo.findnsave.com/api/dailydeal.json"];
    }
    else if([self.typeOfAd isEqualToString:@"LocalAds"]){
        self.list = [testUtils httpCallJsonLocalAd:@"http://100702.demo.findnsave.com/api/localads.json"];
    }
    else{
        self.list = [testUtils httpCallJsonCoupon:@"http://100702.demo.findnsave.com/api/aacoupons.json"];
    }
    
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(940, 10, 75, 40)];
//    imgView.image = [UIImage imageNamed:@"lists.png"];
//    
//    UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 250, 50)];
//    imgView2.image = [UIImage imageNamed:@"tapanywhere.png"];
//    
//    UIImageView *imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 300, 300, 200)];
//    imgView3.image = [UIImage imageNamed:@"deal.png"];
//    
//    UIImageView *imgView4 = [[UIImageView alloc] initWithFrame:CGRectMake(330, 300, 100, 100)];
//    imgView4.image = [UIImage imageNamed:@"press.png"];
//    
//    UIImageView *imgView5 = [[UIImageView alloc] initWithFrame:CGRectMake(400, 200, 250, 100)];
//    imgView5.image = [UIImage imageNamed:@"arrow.png"];
//    
//    UIImageView *imgView6 = [[UIImageView alloc] initWithFrame:CGRectMake(700, 100, 250, 100)];
//    imgView6.image = [UIImage imageNamed:@"arrow.png"];
//    
//    view1 = [[[overlay alloc] initWithFrame:CGRectMake(0,0,1086,900)] autorelease];
//    view1.backgroundColor = [UIColor blackColor];
//    view1.opaque = NO;
//    view1.alpha = 0.8f;
//    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [label setFont:[UIFont boldSystemFontOfSize:18]];
//    [label setTextAlignment:UITextAlignmentCenter];
//    [label setBackgroundColor:[UIColor clearColor]];
//    [label setTextColor:[UIColor whiteColor]];
//    [view1 addSubview:label];
//    [view1 addSubview:imgView];
//    [view1 addSubview:imgView2];
//    [view1 addSubview:imgView3]; 
//    [view1 addSubview:imgView4];
//    [view1 addSubview:imgView5];
//    [view1 addSubview:imgView6];
//    //[self.view addSubview:view1];
    
 //   UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Lists" style:UIBarButtonItemStylePlain target:nil action:@selector(setListsButtonTapped:)];
   // navItem.topItem.rightBarButtonItem = backButton;
  //  [backButton release];
    
  //  navItem.topItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Lists" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
  
    
//    UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
//    recognizer.numberOfTapsRequired = 1;
//    recognizer.numberOfTouchesRequired = 1;
//   // [view1 addGestureRecognizer:recognizer];
    
    
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}
    
//- (void)handleTap{
//    [view1 removeFromSuperview];
//}

- (void) tableFeatures{
    
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor blackColor];
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"apple-everything.jpeg"]];
 //   self.view.backgroundColor = background;
  //  [background release];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1f];
    
}

#pragma mark -
#pragma mark UIGestureRecognizer Delegate/Actions

- (BOOL) gestureRecognizerShouldBegin: (UIGestureRecognizer *) gestureRecognizer
{
	UITableView *col = (UITableView *)gestureRecognizer.view;
	
	if ([col visibleCells].count) {
		NSLog(@"Drag detected");
		return YES;
	} else {
		NSLog(@"Drag cancelled");
		return NO;
	}
    
}

- (void) moveActionGestureRecognizerStateChanged: (UIGestureRecognizer *) recognizer
{
    
    switch ( recognizer.state )
    {
        default:
        case UIGestureRecognizerStateFailed:
            // do nothing
            break;
            
        case UIGestureRecognizerStatePossible:
        case UIGestureRecognizerStateCancelled:
        {
			NSLog(@"Canceled");
            
            break;
        }
        case UIGestureRecognizerStateBegan:
        {
			NSLog(@"Start move..");

            dealObject *dealOb = [self.list objectAtIndex:recognizer.view.tag];
            NSURL *imageURL = dealOb.imageUrlLarge;
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

       //     _lastIndexPath = [self.table indexPathForRowAtPoint:[recognizer locationInView: recognizer.view]];
            NSLog(@"index is %d", recognizer.view.tag);
            
         //   UITableViewCell *sourceCell = [self.table cellForRowAtIndexPath:_lastIndexPath];
            CGRect frame = [self.table convertRect: imageView.frame fromView: self.view];
            
            self.dragView = [[[UIImageView alloc] initWithImage:[imageView screenshot]] autorelease];
            self.dragView.opaque = YES;
            self.dragView.backgroundColor = self.table.backgroundColor;
            
            self.dragView.center = [recognizer locationInView: self.view];
            self.dragView.layer.cornerRadius = 8; // if you like rounded corners
            self.dragView.layer.shadowOffset = CGSizeMake(-5, 2);
            self.dragView.layer.shadowRadius = 5;
            self.dragView.layer.shadowOpacity = 0.5;
            
            [self.view addSubview: self.dragView];
            
            [self.view bringSubviewToFront:self.dragView];
            // grab some info about the origin of this cell
            _dragOriginCellOrigin = frame.origin;
            
            [UIView beginAnimations: @"" context: NULL];
            [UIView setAnimationDuration: 0.2];
            [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
            
            // transformation-- larger, slightly transparent
            self.dragView.transform = CGAffineTransformMakeScale( 0.5, 0.5 );
            
            self.dragView.alpha = 0.7;
            imageView.alpha = 0.7;
            
            [UIView commitAnimations];
            local = [self.table convertPoint:self.dragView.center fromView:self.view];
            global2 = [self.table convertPoint:self.dragView.center fromView:self.view];
            NSLog(@"local is %@", NSStringFromCGPoint(local));
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            
            self.dragView.center = [recognizer locationInView: self.view];            
            global = [self.table convertPoint:self.dragView.center fromView:self.view];
            [UIView beginAnimations: @"" context: NULL];
            [UIView setAnimationDuration: 0.2];
            [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
            [UIView commitAnimations];
            CGPoint corner = CGPointMake(850, -100) ;
            const CGPoint diff = {global.x - corner.x, global.y - corner.y};
          //  NSLog(@"the diff is %@", NSStringFromCGPoint(diff));

            CGPoint listPosition = CGPointMake(987, 15);
            const CGPoint diffSizeReduction = {listPosition.x - local.x, listPosition.y - local.y};
            NSLog(@"the global is %@ ", NSStringFromCGPoint(global));
            if(global.x >= ((diffSizeReduction.x)/2 + global2.x)){
                NSLog(@"the diffSize is %@ local is %@ global is %@", NSStringFromCGPoint(diffSizeReduction), NSStringFromCGPoint(local), NSStringFromCGPoint(global));
                self.dragView.transform = CGAffineTransformMakeScale( 0.2, 0.2 );
            }
            else if(global.x >= (diffSizeReduction.x/3 + global2.x)){
                NSLog(@"the diffSize is %@ local is %@ global is %@", NSStringFromCGPoint(diffSizeReduction), NSStringFromCGPoint(local), NSStringFromCGPoint(global));
                self.dragView.transform = CGAffineTransformMakeScale( 0.3, 0.3 );
            }
            else if(global.x >= (diffSizeReduction.x/6 + global2.x)){
                NSLog(@"the diffSize is %@ local is %@ global is %@", NSStringFromCGPoint(diffSizeReduction), NSStringFromCGPoint(local), NSStringFromCGPoint(global));
                self.dragView.transform = CGAffineTransformMakeScale( 0.4, 0.4 );
            }
            
            if(diff.x>25 && diff.y>-100 && diff.y<200){
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Lists" style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleRightView)];
                backButton.tintColor = [UIColor colorWithRed:34.0/255.0 green:97.0/255.0 blue:221.0/255.0 alpha:1];
                navItem.topItem.rightBarButtonItem = backButton;
                [backButton release];
            }
            else{
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Lists" style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleRightView)];
                navItem.topItem.rightBarButtonItem = backButton;
                [backButton release];
            }
           // NSLog(@"Moving");
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        {
            [self.dragView removeFromSuperview];
            CGPoint corner = CGPointMake(850, -100);//987 15
            const CGPoint diff = {global.x - corner.x, global.y - corner.y};
            NSLog(@"the final is %@", NSStringFromCGPoint(diff));
            if(diff.x>25 && diff.y>-100 && diff.y<200){
                int count = [counter.text intValue];
                count++;
                counter.text = [NSString stringWithFormat:@"%d", count];
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Lists" style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleRightView)];
                navItem.topItem.rightBarButtonItem = backButton;
                [backButton release];
                
                dealObject *dealOb = [self.list objectAtIndex:recognizer.view.tag];
                //NSURL *url = nil;
                NSURL *imageURL = dealOb.imageUrlLarge;

                listTableViewCont *lists = [[listTableViewCont alloc] initWithImage:imageURL withTitle:dealOb.announcementTitle];
                [lists.view setNeedsDisplay];
                NSLog(@"difference worked %@", NSStringFromCGPoint(diff));                
            }
            
            break;
        }
    }
}

- (void)viewDidUnload
{
    self.list = nil;
    self.typeOfAd = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    NSInteger numberOfCells = [self.imagesList count];
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
    
    NSInteger numberOfCells = [self.imagesList count];


    for (NSUInteger i=0; i<[DMPGridViewCell cellsPerRowForStyle:style]; i++) {
        if (offset + i >= numberOfCells)
            break;
        
        DMPGridViewCell *gridCell = [[DMPGridViewCell alloc] initWithStyle:style index:i];
        [gridCell.imageView setImage:[self.imagesList objectAtIndex:(offset + i)]];//        // Image
//        dispatch_queue_t imageDownloadQ = dispatch_queue_create("testIpad image downloader", NULL);
//        dispatch_async(imageDownloadQ, ^{
//            dealObject *dealOb;
//            localAdsObject *localAd;
//            couponsAdsObject *coupon;
//            NSURL *imageURL;
//            if ([self.typeOfAd isEqualToString:@"dailyDeal"]) {
//                dealOb = [self.imagesList objectAtIndex:(offset + i)];
//                imageURL = dealOb.imageUrlLarge;
//            }
//            if([self.typeOfAd isEqualToString:@"LocalAds"]){
//                localAd = [self.list objectAtIndex:(offset + i)];
//                imageURL = localAd.imageUrl;
//                NSLog(@"typeofad is %@", self.typeOfAd);
//            }
//            if([self.typeOfAd isEqualToString:@"coupon"]){
//                coupon = [self.list objectAtIndex:(offset + i)];
//                imageURL = coupon.couponPhotoUrl;
//            }
//            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
//            // ... todo fix
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [gridCell.imageView setImage:image];
//            });
//        });
//        dispatch_release(imageDownloadQ);

            

        // Title
  //      dealObject *dealOb;
  //      localAdsObject *localAd;
  //      couponsAdsObject *coupon;
        NSString *text = @"Product Name 50%";
//        if ([self.typeOfAd isEqualToString:@"dailyDeal"]) {
//            dealOb = [self.list objectAtIndex:(offset + i)];
//            text = [NSString stringWithFormat:@"%@", dealOb.title];
//        }
//        if([self.typeOfAd isEqualToString:@"LocalAds"]){
//            localAd = [self.list objectAtIndex:(offset + i)];
//            text = [NSString stringWithFormat:@"%@", localAd.advName];
//        }
//        if([self.typeOfAd isEqualToString:@"coupon"]){
//            coupon = [self.list objectAtIndex:(offset + i)];
//            text = [NSString stringWithFormat:@"%@", coupon.title];
//        }
//        text = [NSString stringWithFormat:@"%@", dealOb.title]; // ... todo fix
        [gridCell.textLabel setText:text];
        
        // Handle taps.
        
        UITapGestureRecognizer *g2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        g2.numberOfTapsRequired = 2;
        g2.numberOfTouchesRequired = 1;
        [gridCell addGestureRecognizer:g2];
        [g2 release];

        
        gridCell.tag = offset + i;
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreenAnimation:)];
        g.numberOfTapsRequired = 1;
        [g requireGestureRecognizerToFail:g2];
        g.numberOfTouchesRequired = 1;
        [gridCell addGestureRecognizer:g];
        [g release];

//        UILongPressGestureRecognizer* draggingRecognizer = [[UILongPressGestureRecognizer alloc]
//                                                            initWithTarget:self
//                                                            action:@selector(moveActionGestureRecognizerStateChanged:)
//                                                            ];
//        draggingRecognizer.minimumPressDuration = 0.3;
//      //  draggingRecognizer.delegate = self;
//        [gridCell addGestureRecognizer:draggingRecognizer];
//        [draggingRecognizer release];
//        
        [cell.contentView addSubview:gridCell];
        [gridCell release];
    }


    return cell;
}

- (void)tapScreenAnimation:(UIGestureRecognizer *)gestureRecognizer{
    
    
    NSLog(@"tappedScreenShot");
    
  //  dealObject *dealOb = [self.imagesList objectAtIndex:gestureRecognizer.view.tag];
 //   NSURL *imageURL = dealOb.imageUrlLarge;
    UIImage *image = [self.imagesList objectAtIndex:gestureRecognizer.view.tag];
    [self.productsToBeSent addObject:image];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    //     _lastIndexPath = [self.table indexPathForRowAtPoint:[recognizer locationInView: recognizer.view]];
    NSLog(@"index is %d", gestureRecognizer.view.tag);
    
    //   UITableViewCell *sourceCell = [self.table cellForRowAtIndexPath:_lastIndexPath];
    CGRect frame = [self.table convertRect: imageView.frame fromView: self.view];
    
    self.dragView = [[[UIImageView alloc] initWithImage:[imageView screenshot]] autorelease];
    self.dragView.opaque = YES;
    self.dragView.backgroundColor = self.table.backgroundColor;
    
    self.dragView.center = [gestureRecognizer locationInView: self.view];
    self.dragView.layer.cornerRadius = 8; // if you like rounded corners
    self.dragView.layer.shadowOffset = CGSizeMake(-5, 2);
    self.dragView.layer.shadowRadius = 5;
    self.dragView.layer.shadowOpacity = 0.5;
    
    [self.view addSubview: self.dragView];
    
    [self.view bringSubviewToFront:self.dragView];
    // grab some info about the origin of this cell
 //   _dragOriginCellOrigin = frame.origin;
    
    
 //   [UIView beginAnimations:nil context:nil];
    //animate the view from its current position off the top of the screen to 50, 200
    //over 2 seconds
 //   [self.dragView setCenter:CGPointMake(497.0, 704.0)];
 //   [UIView setAnimationDuration: 1.0];
 //   [UIView commitAnimations];


    // transformation-- larger, slightly transparent
  //  self.dragView.transform = CGAffineTransformMakeScale( 0.2, 0.2 );
  //  self.dragView.alpha = 1;
  //  imageView.alpha = 1;
  //  [UIView commitAnimations];
    
    
    self.dragView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    self.dragView.alpha = 1.0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.005];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    self.dragView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
    [UIView commitAnimations];
    
  //  [self performSelector:@selector(fireBlockAfterDelay) withObject:nil afterDelay:0.2];
}

- (void)bounce1AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    [self.dragView setCenter:CGPointMake(self.dragView.frame.origin.x + 100, self.dragView.frame.origin.y - 100)];
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.dragView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05);
    [self.dragView setCenter:CGPointMake(497.0, 704.0)];
    [UIView commitAnimations];
    [self performSelector:@selector(fireBlockAfterDelay) withObject:nil afterDelay:0.3];
}

-(void)fireBlockAfterDelay{
    
    int count = [counter.text intValue];
    self.counter.hidden = NO;
    if(count < 9){
        self.redBadgeLong.hidden = YES;
        self.redBadgeRound.hidden = NO;
    }
    else{
        self.redBadgeLong.hidden = NO;
        self.redBadgeRound.hidden = YES;
    }
    count++;
    counter.text = [NSString stringWithFormat:@"%d", count];
    [self.dragView removeFromSuperview];
}


- (void)tap:(UIGestureRecognizer *)gestureRecognizer {
    dealObject *dealOb;
    localAdsObject *localAd;
    ProductDescriptionViewController *product;
    couponsAdsObject *coupon;
    
    //dealOb = [self.imagesList objectAtIndex:gestureRecognizer.view.tag];
    product = [[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:[self.imagesList objectAtIndex:gestureRecognizer.view.tag] withTitle:@"Product Name 50%" withPrice:@"$50.00" bundle:nil];
    
//    if ([self.typeOfAd isEqualToString:@"dailyDeal"]) {
//        NSLog(@"gestuyre tag is %d", gestureRecognizer.view.tag);
//        dealOb = [self.list objectAtIndex:gestureRecognizer.view.tag];
//        product = [[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:dealOb.imageUrlLarge withTitle:dealOb.title withPrice:dealOb.price bundle:nil];
//    }
//    if([self.typeOfAd isEqualToString:@"LocalAds"]){
//        localAd = [self.list objectAtIndex:gestureRecognizer.view.tag];
//        product = [[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:localAd.imageUrl withTitle:localAd.advName withPrice:nil bundle:nil];
//    }
//    if([self.typeOfAd isEqualToString:@"coupon"]){
//        coupon = [self.list objectAtIndex:gestureRecognizer.view.tag];
//        product = [[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:coupon.couponPhotoUrl withTitle:dealOb.title withPrice:nil bundle:nil];
//    }
    [self presentPopupViewController:product animationType:MJPopupViewAnimationSlideBottomBottom];
    [UIView commitAnimations];
    NSLog(@"tag is %d", gestureRecognizer.view.tag);
}


- (void)listSelected:(NSString *)listSelect{
    
    if ([listSelect compare:@"Red"] == NSOrderedSame) {
        NSLog(@"red");
    } else if ([listSelect compare:@"Green"] == NSOrderedSame) {
        NSLog(@"green");
    } else if ([listSelect compare:@"Blue"] == NSOrderedSame){
        NSLog(@"blue");
    }
    [self.colorPickerPopover dismissPopoverAnimated:YES];

    
}

- (void)setListsButtonTapped:(id)sender {
    NSLog(@"swender is %@", sender);
    if (listPicker == nil) {
        self.listPicker = [[[listPickerController alloc] initWithStyle:UITableViewStylePlain] autorelease];
        listPicker.delegate = self;
        self.colorPickerPopover = [[[UIPopoverController alloc] initWithContentViewController:listPicker] autorelease];
    }
    [self.colorPickerPopover presentPopoverFromRect:CGRectMake(980.0f, 30.0f, 10.0f, 10.0f) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    //[self.colorPickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)lisButtonPress:(id)sender{
    
    NSLog(@"list button pressed");
    
    if ([self.productsToBeSent count] > 0) {
        listTableViewCont *listView = [[listTableViewCont alloc] initWithNibName:@"listTableViewCont" bundle:[NSBundle mainBundle] withImages:self.productsToBeSent];
        [UIView beginAnimations:@"View Flip" context:nil];
        [UIView setAnimationDuration:0.80];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.navigationController.view cache:NO];
        [self.navigationController pushViewController:listView animated:YES];
        [UIView commitAnimations];
        [listView release];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"List Empty"
                              message: @"Kindly tap on the Products to add to the list"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


@end

@implementation UIView (Adiciones)

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
