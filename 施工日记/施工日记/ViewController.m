//
//  ViewController.m
//  施工日记
//
//  Created by ASW on 2017-3-31.
//  Copyright © 2017年 ASW. All rights reserved.
//

#import "ViewController.h"
#import<AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import<AssetsLibrary/AssetsLibrary.h>
#import<CoreLocation/CoreLocation.h>

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus ==AVAuthorizationStatusRestricted ||
        authStatus ==AVAuthorizationStatusDenied)
    {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication]openURL:url];
        }
    }
    
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author ==kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
        
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [_webview loadRequest:request];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_webview stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [_webview stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
