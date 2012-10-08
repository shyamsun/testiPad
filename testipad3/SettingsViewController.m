//
//  SettingsViewController.m
//  testiPad2
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/15/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    //TEMP SECTION STRING HOLDER:
    NSString *sectionHeader = nil;
    //SET TITLE FOR EACH SECTION:
    if(section == 0) {
        sectionHeader = @"Settings";
    }
    //RETURN THE SECTION HEADER FOR EACH SECTION:
    return sectionHeader;
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if(indexPath.row == 0) {
		cell.textLabel.text = @"Create New Account"; 
    }else if(indexPath.row == 1) {
		cell.textLabel.text = @"Sign In";
    }else if(indexPath.row == 2) {
		cell.textLabel.text = @"Facebook Login";
    }else if(indexPath.row == 3) {
		cell.textLabel.text = @"Send Feedback";
    }else if(indexPath.row == 4) {
		cell.textLabel.text = @"Suggest a Catalog";
    }else if(indexPath.row == 5) {
		cell.textLabel.text = @"Terms of Service";
    }else if(indexPath.row == 6) {
		cell.textLabel.text = @"Help Tips";
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if(indexPath.row == 2) {
        facebook = [[Facebook alloc] initWithAppId:@"395590077142954" andDelegate:self];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"FBAccessTokenKey"] 
            && [defaults objectForKey:@"FBExpirationDateKey"]) {
            facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
            facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
        }
        if (![facebook isSessionValid]) {
            [facebook authorize:nil];
            [self fbDidLogin];
        }

    }
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url]; 
}

// For iOS 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url]; 
}

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    NSLog(@"facebook access %@ expiration %@", [facebook accessToken], [facebook expirationDate]);
    [defaults synchronize];
    
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
