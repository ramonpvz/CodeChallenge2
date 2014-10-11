//
//  WikiViewController.m
//  CodeChallenge2
//
//  Created by GLBMXM0002 on 10/10/14.
//  Copyright (c) 2014 asda. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController() <UIWebViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.webView.scrollView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"Bad Error... No Biscuit";
    alertView.message = error.localizedDescription;
    [alertView addButtonWithTitle:@"That sucks!!!!!!!!!!!!"];
    [alertView addButtonWithTitle:@"Go Home"];
    [alertView show];
}

@end
