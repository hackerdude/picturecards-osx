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
	if ( ! [NSBundle loadNibNamed:@"ProfileEditor" owner:self] ) {
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

- (IBAction)openSkillLevelEditor:(id) sender;
{
	if ( ! [NSBundle loadNibNamed:@"SkillLevelEditor" owner:self] ) {
		NSLog(@"Error Loading design-time for Skill Levels!");
	}
}

- (IBAction)addImage:(id) sender
{
	id imageInfo = [[imageArrayController selectedObjects] lastObject];
	if ( ! imageInfo ) return;
	
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel setCanChooseDirectories:NO];
	[openPanel setCanCreateDirectories:NO];
	[openPanel setAllowsMultipleSelection:NO];
	
	SEL select = @selector(addImageSheetDidEnd:returnCode:contextInfo:);
	[openPanel beginSheetForDirectory:nil
								 file:nil
					   modalForWindow:[sender window]
						modalDelegate:self
					   didEndSelector:select
						  contextInfo:imageInfo];
}

- (NSString *)applicationSupportFolder {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] :NSTemporaryDirectory();
    return [basePath stringByAppendingPathComponent:@"AbstractTree"];
}


- (void)addImageSheetDidEnd:(NSOpenPanel*)openPanel 
				 returnCode:(NSInteger)returnCode 
				contextInfo:(NSManagedObject*)recipe 
{ 
	if (returnCode == NSCancelButton) return; 
	NSString *path = [openPanel filename]; 
	//Build the path we want the file to be at 
	NSString *destPath = [self applicationSupportFolder];
	NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString]; 
	destPath = [destPath stringByAppendingPathComponent:guid]; 
	[[NSFileManager defaultManager] copyPath:path 
									  toPath:destPath 
									 handler:nil]; 
	[recipe setValue:destPath forKey:@"imagePath"]; 
} 



@end
