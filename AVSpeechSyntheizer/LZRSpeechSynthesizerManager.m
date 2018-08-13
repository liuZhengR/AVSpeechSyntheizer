//
//  LZRSpeechSynthesizerManager.m
//  AVSpeechSyntheizer
//
//  Created by 刘峥嵘 on 2018/8/13.
//  Copyright © 2018年 刘峥嵘. All rights reserved.
//

#import "LZRSpeechSynthesizerManager.h"
#import <AVFoundation/AVFoundation.h>

@interface LZRSpeechSynthesizerManager()
@property(nonatomic,strong)AVSpeechSynthesizer* synthesizer;
@property(nonatomic,strong)NSArray* voices;
@property(nonatomic,strong)NSArray* speechStrings;

@end
static LZRSpeechSynthesizerManager* speechSynthesizerManager;
@implementation LZRSpeechSynthesizerManager

+ (instancetype)shareSpeechSynthesizerManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        speechSynthesizerManager = [[LZRSpeechSynthesizerManager alloc] init];
    });
    return speechSynthesizerManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        self.voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],[AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"]];
        self.speechStrings = [self setSpeakStrings];
        
    }
    return self;
}

-(NSArray*)setSpeakStrings
{
  
    return @[@"how are you?",@"Fine, thank you,and you?", @"I am fine too"];
}

-(void)beginConversation
{
    for (int i = 0; i<self.speechStrings.count; i++)
    {
        AVSpeechUtterance* utterance = [[AVSpeechUtterance alloc] initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i%2];
        utterance.rate = 0.4;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.synthesizer speakUtterance:utterance];
    }
}
@end
