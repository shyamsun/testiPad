//
//  ProductDescriptionViewController.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/21/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PaperFoldViewController.h"

@interface ProductDescriptionViewController : PaperFoldViewController <MKMapViewDelegate>{
    
    IBOutlet UIImageView *productImageView;
    IBOutlet UIBarButtonItem *close;
    IBOutlet MKMapView *mapKit;
    IBOutlet UIView *centerView;
    UIButton *buttonMapClose;
    IBOutlet UILabel *title;
    IBOutlet UILabel *price;
    IBOutlet UITextView *textView;

}

@property (nonatomic,retain) UIImageView *productImageView;
@property (nonatomic,retain) UIBarButtonItem *close;
@property (nonatomic,retain) IBOutlet MKMapView *mapKit;
@property (nonatomic,retain) IBOutlet UIView *centerView;
@property (nonatomic,retain) IBOutlet UILabel *title;
@property (nonatomic,retain) IBOutlet UILabel *price;
@property (nonatomic,retain) IBOutlet UITextView *textView;

- (void)closeProductDescription;
- (IBAction)closeProduct:(id)sender;
- (IBAction)mapView:(id)sender;
- (void)foldMap;
- (IBAction)buttonClicked:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil withImage:(UIImage *)image withTitle:(NSString *)titleR withPrice:(NSString *)priceR bundle:(NSBundle *)nibBundleOrNil;

@end
