    //
//  ExampleViewController.m
//  Leaves
//
//  Created by Tom Brow on 4/18/10.
//  Copyright 2010 Tom Brow. All rights reserved.
//

#import "ImageExampleViewController.h"
#import "Utilities.h"
#import "ProductDescription.h"
#import "ProductDescriptionViewController.h"

@implementation ImageExampleViewController

- (id)init {
    if (self = [super init]) {
		images = [[NSArray alloc] initWithObjects:
				  [UIImage imageNamed:@"801.jpg"],
				  [UIImage imageNamed:@"802.jpg"],
				  [UIImage imageNamed:@"803.jpg"],
                  [UIImage imageNamed:@"804.jpg"],
				  [UIImage imageNamed:@"805.jpg"],
				  [UIImage imageNamed:@"806.jpg"],
				  [UIImage imageNamed:@"807.jpg"],
				  [UIImage imageNamed:@"808.jpg"],
				  [UIImage imageNamed:@"809.jpg"],
				  [UIImage imageNamed:@"810.jpg"],
				  [UIImage imageNamed:@"811.jpg"],
				  [UIImage imageNamed:@"812.jpg"],
				  nil];
        UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(presentOptions:)];
        
        if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItems)]) {
            self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:optionsButton, nil];
        }else {
            self.navigationItem.rightBarButtonItem = optionsButton;
        }
    }
    return self;
}

- (void)presentOptions:(UIBarButtonItem *)barButton{
    
    NSLog(@"tapped");
    
}


- (void)dealloc {
	[images release];
    [super dealloc];
}

#pragma mark LeavesViewDataSource methods

- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return images.count;
}

- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	UIImage *image = [images objectAtIndex:index];
	CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
	CGAffineTransform transform = aspectFit(imageRect,
											CGContextGetClipBoundingBox(ctx));
	CGContextConcatCTM(ctx, transform);
	CGContextDrawImage(ctx, imageRect, [image CGImage]);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    ProductDescriptionViewController *vc1=[[ProductDescriptionViewController alloc] initWithNibName:@"ProductDescriptionViewController" bundle:nil];
    
    [self.view addSubview: vc1.view];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


@end
