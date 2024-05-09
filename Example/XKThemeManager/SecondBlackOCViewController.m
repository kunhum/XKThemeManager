//
//  SecondBlackOCViewController.m
//  XKThemeManager_Example
//
//  Created by kenneth on 2024/5/8.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

#import "SecondBlackOCViewController.h"
@import XKThemeManager;

@interface SecondBlackOCViewController () <XKThemeOCProtocol>

@end

@implementation SecondBlackOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.theme_white;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%@ will appear", NSStringFromClass(self.class));
}

//- (BOOL)shouldStartTheme {
//    return NO;
//}

@end
