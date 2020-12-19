//
//  AppDelegate.m
//  WebBrowserUPI
//
//  Created by Abbie on 16/12/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)app
        openURL:(NSURL *)url
        options:(NSDictionary<NSString *,id> *)options {

    NSLog(@"Passed URL%@", url);
    NSString *myString = url.absoluteString;
    UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"REDIRECT URI"
                                     message:myString
                                     preferredStyle:UIAlertControllerStyleAlert];

        //Add Buttons

        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                       // [self clearAllData];
                                    }];

        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle no, thanks button
                                   }];

        //Add your buttons to alert controller

        [alert addAction:yesButton];
        [alert addAction:noButton];

       [self. window. rootViewController presentViewController:alert animated:TRUE completion:nil];
    
    // Check the calling application Bundle ID
    if ([[url scheme] isEqualToString:@"yuvitime"])
    {
        NSLog(@"URL scheme:%@", [url scheme]);
//        NSString * yuvitimeRequestValue = [url query];
//        NSDictionary * userInfor = [[NSDictionary alloc]initWithObjectsAndKeys:yuvitimeRequestValue, @"YuvitimeRequest", nil];
//        NSNotificationCenter * notificationCentre = [NSNotificationCenter defaultCenter];
//        [notificationCentre postNotificationName:@"URLSCHEMEACTIVATEDNOTIFICATION" object:self userInfo:userInfor];
        return YES;
    }
    else
        return NO;
}

@end
