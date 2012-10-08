//
//  ProductDescriptionViewController.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/21/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "ProductDescriptionViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "UIView+Screenshot.h"
#import "UIView+Origami.h"
#import "JSON.h"
#import <QuartzCore/QuartzCore.h>

@interface ProductDescriptionViewController ()
{
    BOOL currDirection;
}
@end

@implementation ProductDescriptionViewController

@synthesize productImageView, close, mapKit, centerView, title, price, textView;

- (id)initWithNibName:(NSString *)nibNameOrNil withImage:(UIImage *)image withTitle:(NSString *)titleR withPrice:(NSString *)priceR bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Custom initialization
        close = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeProductDescription)];
        
        dispatch_queue_t imageDownloadQ = dispatch_queue_create("imageDownload", NULL);
        dispatch_async(imageDownloadQ, ^{
      //      NSURL *imageURL = image;
            UIImage *imageR = image; //[UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
            // ... todo fix
            dispatch_async(dispatch_get_main_queue(), ^{
                [productImageView setImage:imageR];
                [self.title setText:titleR];
                [self.price setText:priceR];
            });
        });
        dispatch_release(imageDownloadQ);
    }
    return self;
}

- (IBAction)mapView:(id)sender{

    NSLog(@"map pressed");
    [self.centerView showOrigamiTransitionWith:self.mapKit
                                 NumberOfFolds:3
                                      Duration:0.4
                                     Direction:currDirection
                                    completion:^(BOOL finished) {
                                        
                                    }];
}


- (void)closeProductDescription{
    
    NSLog(@"close pressed");
    [self.view removeFromSuperview];
    
}


- (IBAction)closeProduct:(id)sender{
    
    NSLog(@"close pressed");
    [self.view removeFromSuperview];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"apple-everything.jpeg"]];
//    centerView.backgroundColor = background;
//    [background release];
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.7310;
    zoomLocation.longitude= -73.9977;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10000, 10000);
    [self.mapKit setRegion:viewRegion animated:NO];
    currDirection = XYOrigamiDirectionFromRight;
    buttonMapClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonMapClose.frame = CGRectMake(80, 50, 150, 40);
    [buttonMapClose setTitle:@"Close Map" forState:UIControlStateNormal];
    [buttonMapClose addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.textView.layer.cornerRadius = 5;
    self.textView.backgroundColor = [UIColor lightGrayColor];
    self.view.layer.cornerRadius = 5;
    
    [self.productImageView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.productImageView.layer setBorderWidth: 4.0];
    [self.productImageView.layer setCornerRadius:5];
    
    [self.mapKit addSubview:buttonMapClose];
}

- (IBAction)buttonClicked:(id)sender{
    [self foldMap];
}

- (void)foldMap{
    [self.centerView hideOrigamiTransitionWith:self.mapKit
                                 NumberOfFolds:3
                                      Duration:0.4
                                     Direction:currDirection
                                    completion:^(BOOL finished) {
                                        NSLog(@"finished");
                                    }];
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

@end
