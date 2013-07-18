//
//  OverlayView.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/16/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        
        UIImage *overlayGraphic = [UIImage imageNamed:@"overlaygraphic.png"];
        UIImageView *overlayGraphicView = [[UIImageView alloc] initWithImage:overlayGraphic];
        overlayGraphicView.frame = CGRectMake(60,200,120,60);
        [self addSubview:overlayGraphicView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
