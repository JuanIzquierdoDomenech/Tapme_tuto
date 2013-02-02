//
//  tapViewController.m
//  TapMe
//
//  Created by Juan Jesús Izquierdo Doménech on 31/01/13.
//  Copyright (c) 2013 Juan Jesús Izquierdo Doménech. All rights reserved.
//

#import "tapViewController.h"

@interface tapViewController ()
{
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}

@end

@implementation tapViewController

@synthesize timerLabel, scoreLabel, tapmeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // IMAGES //
    self.view.backgroundColor =
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    
    self.timerLabel.backgroundColor =
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    self.scoreLabel.backgroundColor =
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    
    // SOUNDS //
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Actions

- (IBAction)buttonPressed:(UIButton *)sender
{
    count++;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
    
    [buttonBeep play];
}

#pragma mark - SetUp

- (void)setupGame
{
    seconds = 30;
    count = 0;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:\n%i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(substractTime)
                                            userInfo:nil
                                             repeats:YES];
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];

}

- (void)substractTime
{
    //DLog(@"Substracting time");
    seconds--;
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    
    [secondBeep play];
    
    if (seconds == 0) {
        [timer invalidate];
        
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                   message:[NSString stringWithFormat:@"You scored %i points", count]
                                  delegate:self
                         cancelButtonTitle:@"Never again"
                         otherButtonTitles:@"Play again", nil];
        alert.tag = 1;
        [alert show];
    }
}

#pragma mark - Audio

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *err;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    
    if (!audioPlayer)
        DLog(@"Error with setupAudioPlayerWithFile:type : %@", err.localizedDescription);
    
    return audioPlayer;
}

#pragma mark - AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        case 1:
            if (buttonIndex != alertView.cancelButtonIndex)
                [self setupGame];
            else
                self.tapmeButton.enabled = NO;
            
            break;
            
        default:
            break;
    }
}

@end
