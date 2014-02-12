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

@interface ViewController : UIViewController <AVAudioPlayerDelegate, MPMediaPickerControllerDelegate, UIImagePickerControllerDelegate>
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

@property (weak, nonatomic) IBOutlet UITextField *txtField;
- (IBAction)btnMoviePlay:(UIButton *)sender;
- (IBAction)btnGetThumbnail:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *txtTime;

- (IBAction)btnlaunchCamera:(UIButton *)sender;


@end
