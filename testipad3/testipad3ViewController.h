//
//  testipad3ViewController.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/18/12.
//  Copyright 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMPGridViewController.h"
#import "ProductDescriptionViewController.h"
#import "DMPGridViewDelegate.h"

@interface testipad3ViewController : UIViewController<DMPGridViewDelegate>{
    
    DMPGridViewController *vc;
    NSMutableArray *list;
    UIImage *imageOnSet;
    ProductDescriptionViewController *vc1;
    IBOutlet UIView *view2;
}

@property(nonatomic, retain) DMPGridViewController *vc;
@property(nonatomic, retain) NSMutableArray *list;
@property(nonatomic, retain) UIImage *imageOnSet;

-(IBAction)goGoogle:(id)sender;


@end
