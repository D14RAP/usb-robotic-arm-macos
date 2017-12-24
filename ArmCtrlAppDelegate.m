//
//  ArmCtrlAppDelegate.m
//  ArmCtrl
//
//  Created by Paul Law on 04/03/2011.
//

#import "ArmCtrlAppDelegate.h"
#import "ArmCommand.h"

@implementation ArmCtrlAppDelegate

@synthesize window, byte0, byte1, byte2;
@synthesize segBase, segShoulder, segElbow, segWrist, segGrip, segLight;

unsigned char command[3]; 

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	command[0] = 0;
	command[1] = 0;
	command[2] = 0;
	[self updateDisplay];
}

- (IBAction)segControlClicked:(id)sender {
	
	if (sender == segLight) {
		command[2] = ([sender selectedSegment] == 1) ? 0 : 1;	// Light
	}
	else if (sender == segBase) {
		switch ([sender selectedSegment]) {
			case 0: command[1] = 1; break;		// Base CW
			case 1: command[1] = 0; break;
			case 2: command[1] = 2; break;		// Base CCW
		}
	}
	else if (sender == segShoulder) {
		command[0] &= 0x3F;		// Turn off bit 7+8
		switch ([sender selectedSegment]) {
			case 0: command[0] |= 0x40; break;		// Shoulder Up
			case 2: command[0] |= 0x80; break;		// Shoulder Down
		}
	}
	else if (sender == segElbow) {
		command[0] &= 0xCF;		// Turn off bit 5+6
		switch ([sender selectedSegment]) {
			case 0: command[0] |= 0x10; break;		// Elbow Up
			case 2: command[0] |= 0x20; break;		// Elbow Down
		}
	}
	else if (sender == segWrist) {
		command[0] &= 0xF3;		// Turn off bit 3+4
		switch ([sender selectedSegment]) {
			case 0: command[0] |= 0x04; break;		// Wrist Up
			case 2: command[0] |= 0x08; break;		// Wrist Down
		}
	}
	else if (sender == segGrip) {
		command[0] &= 0xFC;		// Turn off bit 1+2
		switch ([sender selectedSegment]) {
			case 0: command[0] |= 0x02; break;		// Grip Open
			case 2: command[0] |= 0x01; break;		// Grip Close
		}
	}
	CommandArm(command);
	[self updateDisplay];
}

- (IBAction)allStopClicked:(id)sender {
	command[0] = 0; command[1] = 0;
	CommandArm(command);
	[segBase setSelectedSegment:1];
	[segShoulder setSelectedSegment:1];
	[segElbow setSelectedSegment:1];
	[segWrist setSelectedSegment:1];
	[segGrip setSelectedSegment:1];
	[self updateDisplay];
}

- (void)updateDisplay {
	[byte0 setStringValue:[NSString stringWithFormat:@"%02x",command[0]]];
	[byte1 setStringValue:[NSString stringWithFormat:@"%02x",command[1]]];
	[byte2 setStringValue:[NSString stringWithFormat:@"%02x",command[2]]];
}


@end
