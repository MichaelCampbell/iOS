//
//  ViewController.h
//  mediasample
//
//  Created by SSCSIS on 2/6/14.
//  Copyright (c) 2014 SSCSIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate,MPMediaPickerControllerDelegate>
@property(nonatomic, strong) AVAudioPlayer *avPlayer;
@property(nonatomic, strong) MPMusicPlayerController *mpPlayer;

@property(nonatomic, strong) IBOutlet UILabel *lblTitle;

//For AVFoundation.
- (IBAction)btnPlay:(id)sender;
- (IBAction)btnStop:(id)sender;
- (IBAction)sldValueChanged:(id)sender;

//For MediaPlayer.
- (IBAction)btnLaunchiPod:(id)sender;
- (IBAction)btnMediaPlay:(id)sender;
- (IBAction)btnMediaStop:(id)sender;
- (IBAction)sldMediaValueChanged:(id)sender;
@end
