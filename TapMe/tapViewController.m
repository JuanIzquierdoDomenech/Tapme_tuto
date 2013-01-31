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
}

@end

@implementation tapViewController

@synthesize timerLabel, scoreLabel, tapmeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Actions

- (IBAction)buttonPressed:(UIButton *)sender
{
    DLog(@"Presing ca... button");
    count++;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
}

#pragma mark - SetUp

- (void)setupGame
{
    //DLog(@"Setupgame called");
    seconds = 30;
    count = 0;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(substractTime)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)substractTime
{
    //DLog(@"Substracting time");
    seconds--;
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    
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
