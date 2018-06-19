//
//  ViewController.m
//  SimpleProgressBar
//
//  Created by Aban on 6/13/18.
//  Copyright © 2018 Aban. All rights reserved.
//

#import "ViewController.h"
#import "SGCircleProgressBar.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, strong) CALayer* backingLayer;
@property (nonatomic, strong) CAShapeLayer* shapeLayer;
@property (nonatomic, assign) int counter;
@property (nonatomic, strong) SGCircleProgressBar* progressBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    self.counter = 0;
    [super viewDidLoad];

    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor grayColor];
    

    
    self.backingLayer = [CALayer layer];
    self.backingLayer.frame = CGRectMake(50, 50, 100, 100);
    self.backingLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor;
//    self.backingLayer.anchorPoint = CGPointMake(.5, .9);
   
    [self.view.layer addSublayer:self.backingLayer];
    
    self.backingLayer.cornerRadius = self.backingLayer.frame.size.width/2;

    

    self.progressBar = [SGCircleProgressBar createCircleProgressBarWithFrame:CGRectMake(0, 0, 100, 100)];
    self.progressBar.progressBarColor = [[UIColor whiteColor] colorWithAlphaComponent:1];

    
    [self.backingLayer addSublayer:self.progressBar];
    
    
    [self.progressBar startAnimating];
    
    

}





- (IBAction)button:(id)sender {
    
    self.counter += 1;
    
    self.progressBar.currentProgress = self.counter/10.0f;
}


- (IBAction)resetButton:(id)sender
{
    self.progressBar.currentProgress = 0;
    self.counter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
