//
//  InfosViewController.m
//  FPBarButtonItemDemo
//
//  Created by Arnaud de Mouhy on 13/07/12.
//  Copyright (c) 2012 Flying Pingu. All rights reserved.
//

#import "InfosViewController.h"
#import "FPBarButtonItem.h"

@interface InfosViewController ()

@end

@implementation InfosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Informations";
    }
    return self;
}

- (void)dismissInfosView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FPBarButtonItem *closeButton = [[FPBarButtonItem alloc] initWithTitle:@"Close"
                                                                  FPstyle:FPBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(dismissInfosView:)];
    self.navigationItem.leftBarButtonItem = closeButton;
    [closeButton release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [super dealloc];
}
@end
