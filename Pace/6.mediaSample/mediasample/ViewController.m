//
//  ViewController.m
//  mediasample
//
//  Created by SSCSIS on 2/6/14.
//  Copyright (c) 2014 SSCSIS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initiateAVPlayer];
    
    self.mpPlayer = [MPMusicPlayerController applicationMusicPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initiateAVPlayer
{
    self.avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample" ofType:@"mp3"]] error:nil];
    self.avPlayer.delegate = self;
    self.avPlayer.numberOfLoops = 0;
}

- (IBAction)btnPlay:(id)sender
{
    if ([self.avPlayer isPlaying])
    {
        [self.avPlayer setCurrentTime:0];
        [self.avPlayer stop];
    }
    else
    {
        [self.avPlayer play];
    } 
}

- (IBAction)btnStop:(id)sender
{
    [self.avPlayer setCurrentTime:0];
    [self.avPlayer stop];
}

- (IBAction)sldValueChanged:(id)sender
{
    UISlider *slider= (UISlider *) sender;
    self.avPlayer.volume = slider.value;
}

- (IBAction)btnLaunchiPod:(id)sender
{
    MPMediaPickerController *objMediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    objMediaPicker.delegate= self;
    objMediaPicker.allowsPickingMultipleItems = NO;
    [self presentViewController:objMediaPicker animated:TRUE completion:nil];
}

- (void) mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    if ([mediaItemCollection count] > 0)
    {
        self.lblTitle.text = [[[mediaItemCollection items] objectAtIndex:0] valueForProperty:MPMediaItemPropertyTitle];
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

- (void) mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)btnMediaPlay:(id)sender
{
    
    MPMediaPropertyPredicate *titlePredicate = [MPMediaPropertyPredicate predicateWithValue:self.lblTitle.text forProperty:MPMediaItemPropertyTitle];
    MPMediaQuery *mpQuery = [MPMediaQuery new];
    [mpQuery addFilterPredicate:titlePredicate];
    [self.mpPlayer setQueueWithQuery:mpQuery];
    [self.mpPlayer play];
}

- (IBAction)btnMediaStop:(id)sender
{
    [self.mpPlayer stop];
}

- (IBAction)sldMediaValueChanged:(id)sender
{
    UISlider *slider= (UISlider *) sender;
    self.mpPlayer.volume = slider.value;
}



























@end
