//
//  ViewController.m
//  ColorMixApp
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //view에 반영할 r,g,b값
    float r;
    float g;
    float b;
}
@property (weak, nonatomic) IBOutlet UIView *colorView;

//추가한 indicator에 대한 정보 저장
@property (strong, nonatomic) UIActivityIndicatorView *indicatorCode;
- (IBAction)changeColor:(UISlider *)sender;
@end

@implementation ViewController
- (IBAction)switchOnOff:(UISwitch *)sender {
    UISlider *red = self.view.subviews[0];
    UISlider *green = self.view.subviews[1];
    UISlider *blue = self.view.subviews[2];
    //switch에 따라 다른 행동
    //on
    //1.view의 backgroundColor값을 회색으로 변경
    //2.activate indicator stop
    //3.r,g,b enable
    if(sender.on){
        self.colorView.backgroundColor = [UIColor grayColor];
        [self.indicatorCode performSelector:@selector(stopAnimating) withObject:nil afterDelay:0.2];
        red.enabled = YES;
        green.enabled = YES;
        blue.enabled = YES;
    }else{
        //off
        //1.view의 backgroundColor값을 r,g,b로 변경
        //2.activate indicator start
        //3.r,g,b disable
        self.colorView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        [self.indicatorCode performSelector:@selector(startAnimating) withObject:nil afterDelay:0.2];
        red.enabled = NO;
        green.enabled = NO;
        blue.enabled = NO;
    }
    
}
- (IBAction)changeColor:(UISlider *)sender {
    //들어온 sender의 tag에 따라 r,g,b 저장
    if(sender.tag == 0) //red slider
        r = sender.value;
    else if(sender.tag == 1)//green slider
        g = sender.value;
    else if(sender.tag ==2)//blue slider
        b = sender.value;
    
    self.colorView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //slider초기값을 r,g,bd에 저장
    r = 0.5f;
    g = 0.5f;
    b = 0.5f;
	// Do any additional setup after loading the view, typically from a nib.
    self.indicatorCode = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.indicatorCode.hidesWhenStopped = YES;
    self.indicatorCode.center = CGPointMake(156, 436);
    
    [self.view addSubview:self.indicatorCode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
