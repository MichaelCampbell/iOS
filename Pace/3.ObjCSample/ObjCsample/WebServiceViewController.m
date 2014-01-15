//
//  WebServiceViewController.m
//  ObjCsample
//
//  Created by Michael Campbell on 1/14/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "WebServiceViewController.h"
#import "XMLReader.h"

@interface WebServiceViewController ()

@end

@implementation WebServiceViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self getData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getData
{
    NSString *strURL = @"http://www.webservicex.net/currencyconvertor.asmx/ConversionRate?FromCurrency=USD&ToCurrency=JPY";
    NSURLRequest * objRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:strURL]
                                                 cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                             timeoutInterval:30.0];
    NSURLConnection *objConnection = [[NSURLConnection alloc] initWithRequest:objRequest
                                                                     delegate:self];
    
    if (objConnection) {
        self.receivedData = [[NSMutableData alloc] init];
    }
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"data: %@", data);
    [self.receivedData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void) connectionDidFinishLoading: (NSURLConnection *) connection
{
    NSString *strXML = [[NSString alloc] initWithData:self.receivedData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strXML);
    
    XMLReader *objXMLReader = [[XMLReader alloc] init];
    
    [objXMLReader parseXMLFileWithData:self.receivedData
                            parseError:nil];
    NSLog(@"%@", [objXMLReader.arrDouble objectAtIndex:0]);
}

@end
