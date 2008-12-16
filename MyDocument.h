//
//  MyDocument.h
//  picturecards-osx
//
//  Created by David Martinez on 12/14/08.
//  Copyright __MyCompanyName__ 2008 . All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface MyDocument : NSPersistentDocument
{
	IBOutlet IKImageBrowserView *pecsBoard;
	IBOutlet IKImageBrowserView *sentenceStrip;

}

- (IBAction)openCardEditor:(id) sender;
- (IBAction)openImageEditor:(id) sender;
- (IBAction)openChildProfileEditor:(id) sender;
- (IBAction)openNounTypeEditor:(id) sender;
- (IBAction)openImageTypeEditor:(id) sender;
- (IBAction)openSkillLevelEditor:(id) sender;

@end
