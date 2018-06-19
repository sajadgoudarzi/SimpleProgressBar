//
//  SGCircleProgressBar.m
//  SimpleProgressBar
//
//  Created by Aban on 6/19/18.
//  Copyright © 2018 Aban. All rights reserved.
//

#import "SGCircleProgressBar.h"


@interface SGCircleProgressBar ()

@property (nonatomic, strong) CABasicAnimation* rotationAnimation;
//@property (nonatomic, strong) CABasicAnimation* strokeIncreaseAnimation;

@end

@implementation SGCircleProgressBar



# pragma mark - Public Methods

// creates and returns a new intsance with default settings.
+ (SGCircleProgressBar*)createCircleProgressBarWithFrame:(CGRect)frame
{
    SGCircleProgressBar* progressBar = [SGCircleProgressBar layer];
    progressBar.frame = frame;
    
    
    // Set Default Values
    progressBar.rotationDuration = 2.0f;
    progressBar.progressBarWidth = 5;
    progressBar.arcStartAngel = 0.0f;
    progressBar.arcEndAngel = M_PI*2;
    progressBar.clockWiseRotation = YES;
    progressBar.progressBarRadius = frame.size.width/2 - 5;
    progressBar.progressBarCenterPoint = progressBar.position;
    progressBar.progressBarColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    return progressBar;
}



- (void)startAnimating
{
    UIBezierPath* path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:self.progressBarCenterPoint
                    radius:self.progressBarRadius
                startAngle:self.arcStartAngel
                  endAngle:self.arcEndAngel
                 clockwise:self.clockWiseRotation];
    
    
    self.strokeEnd = 0.01f;
    self.path = path.CGPath;
    self.lineCap = kCALineCapRound;
    self.lineJoin = kCALineJoinRound;
    self.lineWidth = self.progressBarWidth;
    self.strokeColor = self.progressBarColor.CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
    
    [self addRotationAnimation];
}




- (void)stopAnimating
{
    
}



#pragma mark - Internal Methods


- (void)setCurrentProgress:(float)currentProgress
{
    if (_currentProgress == currentProgress && (currentProgress <0 || currentProgress > 1) && !(currentProgress > 1 && _currentProgress < 1) && !(currentProgress< 0 && _currentProgress > 0))
    {
        return;
    }
    else
    {
        [self updateProgressBarWithNewValue:currentProgress];
    }
    _currentProgress = currentProgress;
}



- (void)addRotationAnimation
{
    self.rotationAnimation = [CABasicAnimation animation];
    self.rotationAnimation.keyPath = @"transform.rotation";
    self.rotationAnimation.duration = self.rotationDuration;
    self.rotationAnimation.byValue = @(M_PI * 2);
    self.rotationAnimation.repeatCount = 10000;
    [self addAnimation:self.rotationAnimation forKey:@"transform.rotation"];
}


- (void)addProgressBarAnimationWithStrokeEndValue:(NSNumber*)strokeEndValue AndDuration:(float)duration
{
    CABasicAnimation* strokeIncreaseAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeIncreaseAnimation.duration = duration;
    strokeIncreaseAnimation.toValue = strokeEndValue;
    [self applyBasicAnimation:strokeIncreaseAnimation ];
}

- (void)updateProgressBarWithNewValue:(float)updatedProgressValue
{
    [self addProgressBarAnimationWithStrokeEndValue:@(updatedProgressValue) AndDuration:0.50f];
}



- (void)applyBasicAnimation:(CABasicAnimation *)animation
{
    //set the from value (using presentation layer if available)
    animation.fromValue = [self.presentationLayer ?: self valueForKeyPath:animation.keyPath];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self setValue:animation.toValue forKeyPath:animation.keyPath];
    [CATransaction commit];
    //apply animation to layer
    [self addAnimation:animation forKey:nil];
}


@end
