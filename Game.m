//
//  Game.m
//  My Flappy Bird
//
//  Created by John Vu on 2014-09-05.
//  Copyright (c) 2014 JV. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver
{
    if(CurrScore > HighScoreNum)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:CurrScore forKey:@"HighScore"]; 
    }
    [TunnelMovement invalidate];
    [SpriteMovement invalidate];
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Sprite.hidden =YES;
}

-(void)Score
{
    CurrScore = CurrScore + 1;
    Score.text = [NSString stringWithFormat:@"%i", CurrScore];
}

-(IBAction)Start:(id)sender
{
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO; 
    Start.hidden = YES;
    SpriteMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(SpriteMoving) userInfo:nil repeats:YES];
    [self PlaceTunnels];
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

-(void)TunnelMoving
{
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    if(TunnelTop.center.x < -28)
    {
        [self PlaceTunnels];
    }
    if(TunnelTop.center.x == 10)
    {
        [self Score];
    }
    if(CGRectIntersectsRect(Sprite.frame, TunnelTop.frame))
    {
        [self GameOver]; 
    }
    if(CGRectIntersectsRect(Sprite.frame, TunnelBottom.frame))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Sprite.frame, Top.frame))
    {
        [self GameOver];
    }
    if(CGRectIntersectsRect(Sprite.frame, Bottom.frame))
    {
        [self GameOver];
    }
}

-(void)PlaceTunnels
{
    RandTopTunnelPos = arc4random() %350;
    RandTopTunnelPos = RandTopTunnelPos - 288;
    RandBottomTunnelPos = RandTopTunnelPos + 690;
    TunnelTop.center = CGPointMake(340, RandTopTunnelPos);
    TunnelBottom.center = CGPointMake(340, RandBottomTunnelPos);
}

-(void)SpriteMoving
{
    Sprite.center = CGPointMake(Sprite.center.x, Sprite.center.y - SpriteFlight);
    SpriteFlight = SpriteFlight - 5;
    if (SpriteFlight < -15)
    {
        SpriteFlight = -15;
    }
    if (SpriteFlight > 0)
    {
        Sprite.image = [UIImage imageNamed:@"C1.png"];
    }
    if (SpriteFlight < 0)
    {
        Sprite.image = [UIImage imageNamed:@"C2.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SpriteFlight = 30;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    CurrScore = 0;
    HighScoreNum = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
