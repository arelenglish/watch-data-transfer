//
//  InterfaceController.m
//  testerWatch Extension
//
//  Created by Arel English on 1/19/16.
//  Copyright © 2016 Videri. All rights reserved.
//

#import "InterfaceController.h"

@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *imageButton;
@property (nonatomic, weak) NSString *buttonState;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)imageButtonAction {
    if ([self.buttonState isEqualToString:@"blue"]) {
        [self.imageButton setBackgroundColor:[UIColor redColor]];
        self.buttonState = @"red";
    } else {
        [self.imageButton setBackgroundColor:[UIColor blueColor]];
        self.buttonState = @"blue";
    }
}

@end



