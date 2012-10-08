//
//  listTableViewCont.h
//  testipad3
//
//  Created by Shyam Sundar Gavarapet Ashok on 9/17/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol listPickerDelegates
- (void)listSelected:(NSString *)list;
@end


@interface listTableViewCont : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *table;
    NSMutableArray *lists;
    id<listPickerDelegates> _delegate;
    NSURL *urlImage;
    NSString *title2;
    NSArray *arr;
    NSMutableArray *externalArrayImage;
    NSMutableArray *externalArrayTitle;
    UIImageView *dragView;
    NSMutableArray *arrayProducts;
}

@property (nonatomic, retain) UITableView *table;
@property (nonatomic, assign) id<listPickerDelegates> delegate;
@property (nonatomic, assign) NSMutableArray *lists;
@property (nonatomic, assign) NSURL *urlImage;
@property (nonatomic, assign) NSString *title2;
@property (nonatomic, assign) NSMutableArray *externalArrayImage;
@property (nonatomic, assign) NSMutableArray *externalArrayTitle;
@property (nonatomic, assign) UIImageView *dragView;
@property (nonatomic, assign) NSMutableArray *arrayProducts;

- (id)initWithImage:(NSURL *)imageUrl withTitle:(NSString *)titler;
- (IBAction)lisButtonPress:(id)sender;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withImages:(NSMutableArray *)productImages;

@end


@interface UIView (Adicioness)
- (UIImage *) screenshot;
@end
