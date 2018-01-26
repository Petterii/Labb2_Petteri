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
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;

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
    
    NSUserDefaults *rightA = [NSUserDefaults standardUserDefaults];
    self.score = [[rightA objectForKey:@"saved"][2] intValue];
    self.wrong = [[rightA objectForKey:@"saved"][3] intValue];
    // Do any additional setup after loading the view.
    [self doRound];
    
    
}
- (IBAction)buttonPress:(id)sender {
    UIButton *s = sender;
    

     NSUserDefaults *rightA = [NSUserDefaults standardUserDefaults];
    
     if([s.titleLabel.text isEqualToString:self.insertQ[@"rightawnser"]]){
         self.score ++;
         }
     else{
         self.wrong ++;
     }
    NSNumber *mScore = [NSNumber numberWithInt:self.score];
    NSNumber *badScore = [NSNumber numberWithInt:self.wrong];
    
   // @[@(self.score), @(self.wrong)]
    
    NSArray *saved = [NSArray arrayWithObjects:self.insertQ,s.titleLabel.text,mScore,badScore,nil];
    [rightA setObject:saved forKey:@"saved"];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
