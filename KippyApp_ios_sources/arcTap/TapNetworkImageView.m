//
//  Copyright (c) 2013 Click'nTap SRL. All rights reserved.
//

#import "TapNetworkImageView.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "ASIHTTPRequest.h"

@implementation TapNetworkImageView

- (id)initWithFrame:(CGRect)frame url:(NSString*)url {
    self = [super initWithFrame:frame];
    if (self) {
      spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
      spinner.center = CGPointMake(frame.size.width/2, frame.size.height/2);
      [self addSubview:spinner];
      [spinner startAnimating];
      imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
      [self addSubview:imageView];
      imageView.alpha = 0;
      [[self app] downloadResource:url sender:self];
    }
    return self;
}

-(void)layoutSubviews {
  CGSize size = self.frame.size;
  spinner.center = CGPointMake(size.width/2, size.height/2);
  imageView.frame = CGRectMake(0,0,size.width,size.height);
}

-(void)downloadResourceSuccess:(ASIHTTPRequest*)request {
  imageView.image = [UIImage imageWithData:[request responseData]];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"incomingNetworkImage" object:self];
//
//  float r1 = self.frame.size.width/self.frame.size.height;
//  float r2 = imageView.image.size.width/imageView.image.size.height;
//  int r1i = r1*100;
//  int r2i = r2*100;
//  if(r1i > r2i) {
//    int padding = self.frame.size.width-self.frame.size.height*r2;
//    self.frame = CGRectMake(self.frame.origin.x+padding/2,self.frame.origin.y,self.frame.size.height*r2,self.frame.size.height);
//  } else
//  if(r2i > r1i) {
//    int padding = self.frame.size.height-self.frame.size.width/r2;
//    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y+padding/2,self.frame.size.height,self.frame.size.height/r2);
//  }

  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.5];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(removeSpinner)];
  imageView.alpha = 1;
  spinner.alpha = 0;
  [UIView commitAnimations];
}

-(void)downloadResourceFailed:(ASIHTTPRequest*)request {
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.5];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(removeSpinner)];
  spinner.alpha = 0;
  [UIView commitAnimations];
}

-(void)removeSpinner {
  [spinner stopAnimating];
  [spinner removeFromSuperview];
}

-(UIImage*)image {
  return imageView.image;
}

@end
