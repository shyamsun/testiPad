//
//  listPickerController.h
//  testipad3
//
//  Created by Shyam Sundar Gavarapet Ashok on 9/11/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol listPickerDelegate
- (void)listSelected:(NSString *)list;
@end


@interface listPickerController : UITableViewController<UITabBarDelegate, UITableViewDataSource>{
    
    NSMutableArray *lists;
    id<listPickerDelegate> _delegate;
    
}

@property (nonatomic, retain) NSMutableArray *lists;
@property (nonatomic, assign) id<listPickerDelegate> delegate;


@end
