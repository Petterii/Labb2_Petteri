//
//  Questions.m
//  Labb2_Petteri
//
//  Created by lösen är 0000 on 2018-01-21.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "Questions.h"

@implementation Questions

-(instancetype)initWordSetup{
    self = [super init];
    
    if(self){
        NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    
            self.questions = @[
                          @{@"question":@"What am I?" , @"awnser1":@"A Cat" , @"awnser2":@"A Dog", @"awnser3":@"A Fish", @"rightawnser":@"A Human"},
                          @{@"question":@"Where do you encounter Zygons?" , @"awnser1":@"In a Banana" , @"awnser2":@"In the sea", @"awnser3":@"In Star Trek.", @"rightawnser":@"In Doctor who."},
                          @{@"question":@"What did Moss do in \"IT Crowd\" when he incountered a fire in his office?" , @"awnser1":@"Ate" , @"awnser2":@"Used phone", @"awnser3":@"Fainted", @"rightawnser":@"e-mailed"},
                          @{@"question":@"Who wrote \"Stand by me\" book?" , @"awnser1":@"A Cat" , @"awnser2":@"Stephen Spieldberg", @"awnser3":@"Marry Withkins", @"rightawnser":@"Stephen King"},
                          @{@"question":@"Who was the 10th Docthor?" , @"awnser1":@"Peter Capaldi" , @"awnser2":@"Jenna Coalman", @"awnser3":@"Math Smith", @"rightawnser":@"David Tennant"},
                          @{@"question":@"How many holes does a shirt have?" , @"awnser1":@"2" , @"awnser2":@"5", @"awnser3":@"3", @"rightawnser":@"4"},
                          @{@"question":@"Whos not played the Doctor?" , @"awnser1":@"Christopher Eccleston" , @"awnser2":@"Jon Pertwee", @"awnser3":@"Sylvester McCoy", @"rightawnser":@"River Song"},
                          @{@"question":@"Who doesnt belong in a Star Trek world?" , @"awnser1":@"Romulans" , @"awnser2":@"Species 8472", @"awnser3":@"The Ocampa", @"rightawnser":@"Silurians"},
                          @{@"question":@"What is the third expantion to World of Warcraft?" , @"awnser1":@"Mists of Pandaria" , @"awnser2":@"Lich King", @"awnser3":@"Legion", @"rightawnser":@"Cataclysm"},
                          @{@"question":@"What are words mostly used for?" , @"awnser1":@"Ideas" , @"awnser2":@"War", @"awnser3":@"Haggling", @"rightawnser":@"Lies"}
                          
                          ].mutableCopy;
            for (int i = 10; i > 1; i--) [self.questions exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform(i)];
            
        
        
        
    }
    return self;
}



-(NSDictionary*)getQoA:(int)nextQ{

    return self.questions[nextQ];

}

-(void)randomizeAwnsers{
    
     self.slump = @[@"awnser1",@"awnser2",@"awnser3",@"rightawnser"].mutableCopy;
    
    for (int i = 4; i > 1; i--) [self.slump exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform(i)];
    
   //  return slump;
}



@end
