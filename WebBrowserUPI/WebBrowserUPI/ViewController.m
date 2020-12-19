//
//  ViewController.m
//  WebBrowserUPI
//
//  Created by Abbie on 16/12/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)action:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"https://irynasholosova.000webhostapp.com/"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
             NSLog(@"Opened url");
        }
    }];
}

@end
