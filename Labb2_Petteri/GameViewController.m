//
//  GameViewController.m
//  Labb2_Petteri
//
//  Created by lösen är 0000 on 2018-01-21.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "GameViewController.h"
#import "Questions.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *restartGame;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UIButton *awnButton1;
@property (weak, nonatomic) IBOutlet UIButton *awnButton2;
@property (weak, nonatomic) IBOutlet UIButton *awnButton3;
@property (weak, nonatomic) IBOutlet UIButton *awnButton4;
@property (nonatomic) NSDictionary *insertQ;
@property (nonatomic) Questions *q;
@property (nonatomic) NSString *rightAwnser;
@property (nonatomic) int score;
@property (nonatomic) int wrong;
@end

@implementation GameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.q = [[Questions alloc] initWordSetup];
    [self doRound];
    
    
}
- (IBAction)buttonPress:(id)sender {
    UIButton *s = sender;
    
     if([s.titleLabel.text isEqualToString:self.insertQ[@"rightawnser"]]){
         self.score ++;
         }
     else{
         self.wrong ++;
     }
    
    if ((self.score+self.wrong) >= 5) {
        self.questionText.text = [NSString stringWithFormat:@"Rigth: %d     Wrong:%d",self.score,self.wrong];
        self.awnButton1.enabled = NO;
        self.awnButton2.enabled = NO;
        self.awnButton3.enabled = NO;
        self.awnButton4.enabled = NO;
        [self.awnButton1 setTitle:@"Game" forState:UIControlStateNormal];
        [self.awnButton2 setTitle:@"Over" forState:UIControlStateNormal];
        [self.awnButton3 setTitle:@"The" forState:UIControlStateNormal];
        [self.awnButton4 setTitle:@"End" forState:UIControlStateNormal];
    }
    else{
        [self doRound];
    }
}




-(void)doRound{
    
    self.insertQ = [self.q getQoA:(self.score+self.wrong)];
    self.questionText.text = self.insertQ[@"question"];
    [self.q randomizeAwnsers];

    [self.awnButton1 setTitle:self.insertQ[self.q.slump[0]] forState:UIControlStateNormal];
    [self.awnButton2 setTitle:self.insertQ[self.q.slump[1]] forState:UIControlStateNormal];
    [self.awnButton3 setTitle:self.insertQ[self.q.slump[2]] forState:UIControlStateNormal];
    [self.awnButton4 setTitle:self.insertQ[self.q.slump[3]] forState:UIControlStateNormal];
   
    
}

- (IBAction)restartGame:(id)sender {
  
    self.awnButton1.enabled = YES;
    self.awnButton2.enabled = YES;
    self.awnButton3.enabled = YES;
    self.awnButton4.enabled = YES;
    self.score = 0;
    self.wrong = 0;
    [self doRound];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
