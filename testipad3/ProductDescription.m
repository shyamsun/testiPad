//
//  ProductDescription.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/19/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "ProductDescription.h"

@implementation ProductDescription

@synthesize productImageView, close, productDetail;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        close = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeProductDescription)];  
        
    }
    return self;
}
    
- (void)closeProductDescription{
    
    NSLog(@"close pressed");
    [self removeFromSuperview];
    
}
    

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
