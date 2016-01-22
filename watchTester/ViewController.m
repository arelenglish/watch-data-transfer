//
//  ViewController.m
//  watchTester
//
//  Created by Arel English on 1/19/16.
//  Copyright © 2016 Videri. All rights reserved.
//

#import "ViewController.h"
@import WatchConnectivity;

@interface ViewController () <WCSessionDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *buttonImage;
@property (weak, nonatomic) IBOutlet UIButton *pictureButton;

@end

@implementation ViewController

NSString *imageURL = @"http://cdn2.hubspot.net/hub/17518/file-13357813-png/gallery/album/1633/piper_archer_lx_1.png";

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

- (IBAction)pictureButton:(id)sender {
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:imageURL]
      completionHandler:^(NSData *data,
                          NSURLResponse *response,
                          NSError *error){
          NSLog(@"%@", response);
          self.buttonImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:response.URL]];
      }] resume];
    self.buttonImage.contentMode = UIViewContentModeScaleAspectFit;
    self.buttonImage.hidden = NO;
    self.pictureButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    NSDictionary *messageDict = [message objectForKey:@"pictureButton"];
    NSLog(@"%@",messageDict);
}

@end
