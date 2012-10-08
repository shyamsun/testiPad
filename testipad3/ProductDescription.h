//
//  ProductDescription.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/19/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDescription : UIView{
    
    IBOutlet UIImageView *productImageView;
    IBOutlet UIBarButtonItem *close;
    IBOutlet UIView *productDetail;
    
}

@property (nonatomic,retain) UIImageView *productImageView;
@property (nonatomic,retain) UIBarButtonItem *close;
@property (nonatomic,retain) UIView *productDetail;

- (void)closeProductDescription;

@end
