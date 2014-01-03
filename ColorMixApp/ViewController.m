//
//  ViewController.m
//  ColorMixApp
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    float r;
    float g;
    float b;
    UIActivityIndicatorView *indicatorCode;
}
@property (weak, nonatomic) IBOutlet UIView *colorView;
- (IBAction)changeColor:(UISlider *)sender;
@end

@implementation ViewController
- (IBAction)switchOnOff:(UISwitch *)sender {
    UISlider *red = self.view.subviews[0];
    UISlider *green = self.view.subviews[1];
    UISlider *blue = self.view.subviews[2];
    if(sender.on){
        self.colorView.backgroundColor = [UIColor grayColor];
        [indicatorCode performSelector:@selector(stopAnimating) withObject:nil afterDelay:0.2];
        red.enabled = YES;
        green.enabled = YES;
        blue.enabled = YES;
    }else{
        self.colorView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        [indicatorCode performSelector:@selector(startAnimating) withObject:nil afterDelay:0.2];
        red.enabled = NO;
        green.enabled = NO;
        blue.enabled = NO;
    }
    
}
- (IBAction)changeColor:(UISlider *)sender {
    if(sender.tag == 0)
        r = sender.value;
    else if(sender.tag == 1)
        g = sender.value;
    else if(sender.tag ==2)
        b = sender.value;
    
    self.colorView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    r = 0.5f;
    g = 0.5f;
    b = 0.5f;
	// Do any additional setup after loading the view, typically from a nib.
    indicatorCode = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicatorCode.hidesWhenStopped = YES;
    indicatorCode.center = CGPointMake(156, 436);
    
    [self.view addSubview:indicatorCode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
