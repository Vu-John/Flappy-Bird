//
//  Game.h
//  My Flappy Bird
//
//  Created by John Vu on 2014-09-05.
//  Copyright (c) 2014 JV. All rights reserved.
//

#import <UIKit/UIKit.h>

int SpriteFlight;
int RandTopTunnelPos;
int RandBottomTunnelPos;
int CurrScore; // ScoreNumber
NSInteger HighScoreNum; // HighScoreNumber

@interface Game : UIViewController
{
    IBOutlet UIImageView *Sprite;
    IBOutlet UIButton *Start;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *Score; // ScoreLabel
    
    NSTimer *SpriteMovement;
    NSTimer *TunnelMovement;
}

-(IBAction)Start:(id)sender;
-(void)SpriteMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
