//
//  AwnserViewController.m
//  Labb2_Petteri
//
//  Created by lösen är 0000 on 2018-01-21.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "AwnserViewController.h"

@interface AwnserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wrongeText;
@property (weak, nonatomic) IBOutlet UILabel *awnserIs;
@property (weak, nonatomic) IBOutlet UILabel *scoreText;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (weak, nonatomic) IBOutlet UIButton *restartGame;

@end

@implementation AwnserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *rightA = [NSUserDefaults standardUserDefaults];
    /*
    NSDictionary *aAwnser = [rightA objectForKey:@"theQuestion"];
    NSString *buttonPressed = [rightA objectForKey:@"buttonPressed"];
    int score = [[rightA stringForKey:@"score"] intValue];
    self.scoreText.text = [NSString stringWithFormat:@"Score: %d", score];
    */
    
    NSArray *saved = [rightA objectForKey:@"saved"];
    
    NSDictionary *aAwnser =saved[0];
    NSString *buttonPressed = saved[1];
    int score = [saved[2] intValue];
    int badScore = [saved[3] intValue];
    self.restartGame.enabled = NO;
    self.nextQuestion.enabled = YES;
    self.scoreText.text = [NSString stringWithFormat:@"Score: %d", score];
    self.wrongeText.text = [NSString stringWithFormat:@"Wrong: %d", badScore];
    if([buttonPressed isEqualToString:aAwnser[@"rightawnser"]]){
        self.awnserIs.text = [NSString stringWithFormat:@"CORRECT"];
    }
    else {
        self.awnserIs.text = [NSString stringWithFormat:@"WRONG"];
    }
    
    if ((score+badScore) >= 5) {
       
        NSUserDefaults *rightA = [NSUserDefaults standardUserDefaults];
        
        [rightA setObject:nil forKey:@"saved"];
        [rightA setObject:nil forKey:@"myquestions"];
        self.restartGame.enabled = YES;
        self.nextQuestion.enabled = NO;
    }
}
- (IBAction)nextQuestion:(id)sender {
//    [self dismissViewControllerAnimated:NO completion:nil];
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
