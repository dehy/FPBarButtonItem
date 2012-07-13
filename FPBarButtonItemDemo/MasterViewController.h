//
//  MasterViewController.h
//  FPBarButtonItemDemo
//
//  Created by Arnaud de Mouhy on 13/07/12.
//  Copyright (c) 2012 Flying Pingu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
