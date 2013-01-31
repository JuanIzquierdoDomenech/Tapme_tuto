//
//  tapViewController.h
//  TapMe
//
//  Created by Juan Jesús Izquierdo Doménech on 31/01/13.
//  Copyright (c) 2013 Juan Jesús Izquierdo Doménech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tapViewController : UIViewController <UIAlertViewDelegate>

//OUTLETS
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *tapmeButton;


//ACTIONS
- (IBAction)buttonPressed:(UIButton *)sender;


@end
