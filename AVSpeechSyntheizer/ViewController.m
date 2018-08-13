//
//  ViewController.m
//  AVSpeechSyntheizer
//
//  Created by 刘峥嵘 on 2018/8/13.
//  Copyright © 2018年 刘峥嵘. All rights reserved.
//

#import "ViewController.h"
#import "LZRSpeechSynthesizerManager.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)touchBegin:(UIButton *)sender
{
    [[LZRSpeechSynthesizerManager shareSpeechSynthesizerManager] beginConversation];
}

@end
