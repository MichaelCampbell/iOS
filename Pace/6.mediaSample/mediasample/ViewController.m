//
//  ViewController.m
//  mediasample
//
//  Created by SSCSIS on 2/6/14.
//  Copyright (c) 2014 SSCSIS. All rights reserved.
//

#import "ViewController.h"
#import "CustomMPMoviePlayerViewController.h"
@import CoreFoundation;
@import MobileCoreServices;

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

- (IBAction)btnMoviePlay:(UIButton*)sender
{
//    @"http://goo.gl/MMOexY"
    CustomMPMoviePlayerViewController *objMPMoviePlayerController = [[CustomMPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:self.txtField.text]];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:objMPMoviePlayerController.moviePlayer];
    
    [self presentMoviePlayerViewControllerAnimated:objMPMoviePlayerController];
}

- (IBAction)btnGetThumbnail:(UIButton *)sender
{
    MPMoviePlayerController *objMPMoviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.txtField.text]];
    self.imageView.image = [objMPMoviePlayerController thumbnailImageAtTime:[self.txtTime.text integerValue] timeOption:MPMovieTimeOptionNearestKeyFrame];
}

- (void) videoFinished:(NSNotification *) notification
{
    CustomMPMoviePlayerViewController *objMPMoviePlayerController = [[CustomMPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://goo.gl/MMOexY"]];
    [self presentMoviePlayerViewControllerAnimated:objMPMoviePlayerController];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
//    UISlider *slider= (UISlider *) sender;
//    self.mpPlayer.volume = slider.value;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)btnlaunchCamera:(UIButton *)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.view.frame = [[UIScreen mainScreen] applicationFrame];
        pickerImage.view.frame = [[UIScreen mainScreen] applicationFrame];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:FALSE];
        pickerImage.delegate = self;
        
        [self presentViewController:pickerImage
                           animated:YES
                         completion:nil];
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    self.imageView.image = nil;
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
