//
//  LZRSpeechSynthesizerManager.h
//  AVSpeechSyntheizer
//
//  Created by 刘峥嵘 on 2018/8/13.
//  Copyright © 2018年 刘峥嵘. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LZRSpeechSynthesizerManager : NSObject
+(instancetype)shareSpeechSynthesizerManager;
-(void)beginConversation;
@end

