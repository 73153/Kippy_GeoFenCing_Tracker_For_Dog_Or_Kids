//
//  Copyright (c) 2012 Click'nTap SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapWebView : UIWebView<UIWebViewDelegate> {
  UIActivityIndicatorView* spinner;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;

@end
