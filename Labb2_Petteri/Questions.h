//
//  Questions.h
//  Labb2_Petteri
//
//  Created by lösen är 0000 on 2018-01-21.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questions : NSObject
@property (nonatomic) NSMutableArray *questions;
@property (nonatomic) NSDictionary *dicQuestions;
@property (nonatomic)  NSMutableArray *slump;

-(void)randomizeAwnsers;
-(NSDictionary*)getQoA:(int)nextQ;
-(instancetype)initWordSetup;
@end
