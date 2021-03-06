//
//  ExtensionDelegate.m
//  testerWatch Extension
//
//  Created by Arel English on 1/19/16.
//  Copyright © 2016 Videri. All rights reserved.
//

#import "ExtensionDelegate.h"
@import WatchConnectivity;

@interface ExtensionDelegate () <WCSessionDelegate>

@end

@implementation ExtensionDelegate

- (instancetype)init {
    self = [super init];

    if (self) {
        if ([WCSession isSupported]) {
            WCSession *watchSession = [WCSession defaultSession];
            watchSession.delegate = self;
            [watchSession activateSession];
        }
    }
    return self;
}


- (void)applicationDidFinishLaunching {
    // Perform any final initialization of your application.
}

- (void)applicationDidBecomeActive {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, etc.
}

@end
