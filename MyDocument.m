//
//  MyDocument.m
//  picturecards-osx
//
//  Created by David Martinez on 12/14/08.
//  Copyright __MyCompanyName__ 2008 . All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

- (id)init
{
    self = [super init];
    if (self) {
    
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
    
    }
    return self;
}

- (NSString *)windowNibName
{
    return @"PictureBoard"; // PictureCardDesign
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
} 

- (IBAction)saveDocument:(id) sender
{
	[super saveDocument:sender];
}


- (IBAction)openCardEditor:(id) sender
{
	if ( ! [NSBundle loadNibNamed:@"CardEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for picture cards!");
	}
}

- (IBAction)openImageEditor:(id) sender 
{
	if ( ! [NSBundle loadNibNamed:@"ImageEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for Images!");
	}
}


- (IBAction)openChildProfileEditor:(id) sender;
{
	if ( ! [NSBundle loadNibNamed:@"ChildProfileEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for Child Profiles!");
	}
}

- (IBAction)openNounTypeEditor:(id) sender;
{
	if ( ! [NSBundle loadNibNamed:@"NounTypeEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for NounTypes!");
	}
}

- (IBAction)openImageTypeEditor:(id) sender;
{
	if ( ! [NSBundle loadNibNamed:@"ImageTypeEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for ImageTypes!");
	}
}



@end
