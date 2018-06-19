//
//  SGCircleProgressBar.h
//  SimpleProgressBar
//
//  Created by Aban on 6/19/18.
//  Copyright © 2018 Aban. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SGCircleProgressBar : CAShapeLayer


// Default is Black with alpha 0.8;
@property (nonatomic, strong) UIColor* progressBarColor;

// Default is 2.0f secconds, zero or negetive will stop rotating.
@property (nonatomic, assign) float rotationDuration;

// Width of circle progress bar, default is 5px.
@property (nonatomic, assign) float progressBarWidth;

// Width of Circle progress bar radius, default is layer frame.size.width/2 - 5.
@property (nonatomic, assign) float progressBarRadius;

// Protion of completed progress. updating this value will be applied with animation. it should be between 0 and 1. 
@property (nonatomic, assign) float currentProgress;

// Progress bar Center, default is Layer center.
@property (nonatomic, assign) CGPoint progressBarCenterPoint;


// Default is 0 Radian.
@property (nonatomic, assign) CGFloat arcStartAngel;

// Default is 2 * M_PI Radian.
@property (nonatomic, assign) CGFloat arcEndAngel;

// ClockWise Rotation, default is YES.
@property (nonatomic, assign) BOOL clockWiseRotation;




// Creates and returns a new intsance with default settings.
+ (SGCircleProgressBar*)createCircleProgressBarWithFrame:(CGRect)frame;



- (void)startAnimating;

- (void)stopAnimating;





@end
