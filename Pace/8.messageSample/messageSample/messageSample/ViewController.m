//
//  ViewController.m
//  messageSample
//
//  Created by Michael Campbell on 2/20/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)btnEmail_Click:(UIButton *)sender;
- (IBAction)btnCall_Click:(UIButton *)sender;
- (IBAction)btnSMS_Click:(UIButton *)sender;
- (IBAction)btnFacebook_Click:(UIButton *)sender;
- (IBAction)btnTwitter_Click:(UIButton *)sender;
- (IBAction)btnLaunchCamera:(UIButton *)sender;
@property (nonatomic, strong) UIImage *photo;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEmail_Click:(UIButton *)sender
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *objMailViewController = [[MFMailComposeViewController alloc] init];
        objMailViewController.mailComposeDelegate = self;
        [objMailViewController setToRecipients:[[NSArray alloc] initWithObjects:@"a@a.com", nil]];
        [objMailViewController setSubject:@"Sample Subject"];
        [objMailViewController addAttachmentData:UIImagePNGRepresentation(self.photo) mimeType:@"image/png" fileName:@"photo"];
        [self presentViewController:objMailViewController
                           animated:YES
                         completion:^{
                             NSLog(@"You should be able to send an email now");
                         }];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:TRUE
                             completion:^{
                                 if (!error) {
                                     NSLog(@"Your message has been sent");
                                 }
                             }];
}

- (IBAction)btnCall_Click:(UIButton *)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"telprompt:<TEL>" stringByReplacingOccurrencesOfString:@"<TEL>" withString:@"8001234567"]]];
}

- (IBAction)btnSMS_Click:(UIButton *)sender
{
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *objMessageViewController = [[MFMessageComposeViewController alloc] init];
        objMessageViewController.messageComposeDelegate = self;
        [objMessageViewController setRecipients:[[NSArray alloc] initWithObjects:nil]];
        [self presentViewController:objMessageViewController
                           animated:YES
                         completion:^{
                             NSLog(@"You should be able to send a message now");
                         }];
    }

}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:TRUE
                             completion:^{
                                 if (result == MessageComposeResultSent) {
                                     NSLog(@"Your message has been sent");
                                 }
                             }];
}

- (IBAction)btnFacebook_Click:(UIButton *)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *objController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [objController setInitialText:@"Test message for Facebook"];
        [objController addImage:self.photo];
        [objController addURL:[NSURL URLWithString:@"http://www.google.com"]];
        [self presentViewController:objController
                           animated:YES
                         completion:^{
                              NSLog(@"You should be able to send a message to facebook now");
                         }];
    }
}

- (IBAction)btnTwitter_Click:(UIButton *)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *objController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [objController setInitialText:@"Test message for Twitter"];
        [objController addImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://stickerish.com/wp-content/uploads/2011/03/RageFaceBlackSS.png"]]]];
//        [objController addURL:[NSURL URLWithString:@"http://www.google.com"]];
        [self presentViewController:objController
                           animated:YES
                         completion:^{
                             NSLog(@"You should be able to send a message to Twitter now");
                         }];
    }
}

- (IBAction)btnLaunchCamera:(UIButton *)sender
{
    [self CapturePhoto];
}

- (void) CapturePhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
//        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;        
//        self.view.frame = [[UIScreen mainScreen] applicationFrame];
//        pickerImage.view.frame = [[UIScreen mainScreen] applicationFrame];
        pickerImage.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeVideo, nil];
        pickerImage.delegate = self;
        
        [self presentViewController:pickerImage
                           animated:YES
                         completion:nil];
    }

}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
