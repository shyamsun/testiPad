//
//  testipad3ViewController.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/18/12.
//  Copyright 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "testipad3ViewController.h"
#import "DMPGridViewController.h"
#import "ImageExampleViewController.h"
#import "ProductDescription.h"
#import "testUtils.h"
#import "dealObject.h"
#import "ProductDescriptionViewController.h"
#import "UIViewController+MJPopupViewController.h"

@implementation testipad3ViewController

@synthesize vc, list, imageOnSet;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"apple-everything.jpeg"]];
    self.view.backgroundColor = background;
    [background release];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1f];
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;

    list = [[NSMutableArray alloc] init];
    list = [testUtils httpCallJsonDeal:@"http://100702.demo.findnsave.com/api/dailydeal.json"];
    vc = [[DMPGridViewController alloc] initWithDelegate:self];
    [self.view addSubview:vc.view];
    view2 = [[UIView alloc] init];
    [vc.view addSubview:view2];
    
    // NSArray * paths = [NSBundle pathsForResourcesOfType: @"png" inDirectory: [[NSBundle mainBundle] bundlePath]];
    [super viewDidLoad];
}


-(IBAction)goGoogle:(id)sender{
    
    //  SVWebViewController *productWebViewController = [[SVWebViewController alloc] initWithAddress:@"https://www.google.com/"];
    //  [self.navigationController  pushViewController:productWebViewController animated:YES];
    //  [productWebViewController release];
}

- (NSInteger)numberOfCellsForGridViewController:(DMPGridViewController *)gridViewController {
    NSLog(@"good cells");
    return [self.list count];
}
- (NSURL *)gridViewController:(DMPGridViewController *)gridViewController imageForCellAtIndex:(NSUInteger)index {
    dealObject *dealOb = [self.list objectAtIndex:index];
    //return [UIImage imageNamed:[NSString stringWithFormat:[allImageNames objectAtIndex:index]]];
    return dealOb.imageUrlLarge;
}
- (NSString *)gridViewController:(DMPGridViewController *)gridViewController titleForCellAtIndex:(NSUInteger)index {
    dealObject *dealOb = [self.list objectAtIndex:index];
    return [NSString stringWithFormat:@"%@", dealOb.title];
}
- (dealObject *)gridViewController:(DMPGridViewController *)gridViewController tappedCellAtIndex:(NSUInteger)index{
    
    vc1=[[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" withImage:nil withTitle:nil withPrice:nil bundle:nil];
    [self presentPopupViewController:vc1 animationType:MJPopupViewAnimationSlideBottomBottom];
    [UIView commitAnimations];
    
    return [self.list objectAtIndex:index];

//    ImageExampleViewController *image = [[ImageExampleViewController alloc] init];
//    [self.navigationController pushViewController:image animated:YES];
//     [image release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    vc = nil;
    list = nil;

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
