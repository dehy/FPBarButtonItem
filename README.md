FPBarButtonItem
===============

FPBarButtonItem is a custom class to create flat BarButtonItems

Compatible iOS 4.0+ with fallback to default UIBarButtonItems if executed on < 5.0

Sample App
----------

The sample app will let you see the FPBarButtonItems in differents situations: simple action button, back button in a navigationController scenario, and a typical "close" modal view button.
    
Usage
-----

1. Drag & Drop the "FPBarButtonItem" folder to your project file browser - or - click "File" > "Add File to …" and select the "FPBarButtonItem" folder

2. Ensure that the "Copy items into destination group's folder (if needed)" is checked

3. Import the "FPBarButtonItem.h" header file

4. Code :)

Sample :

	#import "FPBarButtonItem.h"
		
	...
		
	- (void)viewDidLoad
	{
	   	[super viewDidLoad];
	
		FPBarButtonItem *infosButton = [[FPBarButtonItem alloc] initWithTitle:@"Infos"
                                                                  FPstyle:FPBarButtonItemStyleBordered
                                                                   target:self
                                                                   action:@selector(openInfosView:)];
	
		self.navigationItem.leftBarButtonItem = actionButton;
	
	   	[actionButton release];
	}

   
Credits
-------

FPBarButtonItem is brought to you by [Flying Pingu](http://flyingpingu.com). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/flyingpingu/FPBarButtonItem/issues/new). If you're using FPBarButtonItem in your project, attribution would be nice.