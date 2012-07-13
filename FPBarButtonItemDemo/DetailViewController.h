//
//  DetailViewController.h
//  FPBarButtonItemDemo
//
//  Created by Arnaud de Mouhy on 13/07/12.
//  Copyright (c) 2012 Flying Pingu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
