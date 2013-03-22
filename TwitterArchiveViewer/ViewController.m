//
//  ViewController.m
//  TwitterArchiveViewer
//
//  Created by shuichi on 13/03/22.
//  Copyright (c) 2013年 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.scrollView.bounces = NO;
    self.webView.scalesPageToFit = YES;
    
    [self startLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (void)startLoad {

    // tweetsフォルダ
    NSString *basePath = [[NSBundle mainBundle] pathForResource:@"tweets"
                                                         ofType:nil];
    
    NSURL *baseUrl = [NSURL fileURLWithPath:basePath];
    
    if (!baseUrl) {
        
        UIAlertView *alert = [[UIAlertView alloc] init];
        alert.title = @"Can't find tweets folder";
        [alert show];
        
        return;
    }
    
    // index.html
    NSString *indexPath = [basePath stringByAppendingString:@"/index.html"];
    NSURL *indexUrl = [NSURL fileURLWithPath:indexPath];
    
    if (!indexUrl) {
        
        UIAlertView *alert = [[UIAlertView alloc] init];
        alert.title = @"Can't find index.html";
        [alert show];

        return;
    }

    NSString *content = [NSString stringWithContentsOfURL:indexUrl
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil];
    
    
    [self.webView loadHTMLString:content
                         baseURL:baseUrl];
}

@end
