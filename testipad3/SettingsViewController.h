//
//  SettingsViewController.h
//  testiPad2
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/15/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface SettingsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, FBSessionDelegate>{
    
    IBOutlet UITableView *table;
    Facebook *facebook;

}

- (void)fbDidLogin;

@end
