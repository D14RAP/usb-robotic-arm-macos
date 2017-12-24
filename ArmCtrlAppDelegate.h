//
//  ArmCtrlAppDelegate.h
//  ArmCtrl
//
//  Created by Paul Law on 04/03/2011.
//

#import <Cocoa/Cocoa.h>

@interface ArmCtrlAppDelegate : NSObject {
    NSWindow *window;
	
	NSTextField *byte0;
	NSTextField *byte1;
	NSTextField *byte2;
	
	NSSegmentedControl *segBase;
	NSSegmentedControl *segShoulder;
	NSSegmentedControl *segElbow;
	NSSegmentedControl *segWrist;
	NSSegmentedControl *segGrip;
	NSSegmentedControl *segLight;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *byte0;
@property (assign) IBOutlet NSTextField *byte1;
@property (assign) IBOutlet NSTextField *byte2;
@property (assign) IBOutlet NSSegmentedControl *segBase;
@property (assign) IBOutlet NSSegmentedControl *segShoulder;
@property (assign) IBOutlet NSSegmentedControl *segElbow;
@property (assign) IBOutlet NSSegmentedControl *segWrist;
@property (assign) IBOutlet NSSegmentedControl *segGrip;
@property (assign) IBOutlet NSSegmentedControl *segLight;

- (IBAction)segControlClicked:(id)sender;
- (IBAction)allStopClicked:(id)sender;

- (void)updateDisplay;

@end
