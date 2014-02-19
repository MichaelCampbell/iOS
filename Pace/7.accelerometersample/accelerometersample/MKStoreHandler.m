//
//  MKStoreHandler.m
//  accelerometersample
//
//  Created by Michael Campbell on 2/18/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "MKStoreHandler.h"

@implementation MKStoreHandler

static MKStoreHandler *sharedHandler;

+ (MKStoreHandler *) sharedHandler
{
    if (!sharedHandler) {
        sharedHandler.storeManager = [[MKStoreManager alloc] init];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:sharedHandler.storeManager];
    }
    return sharedHandler;
}

- (void) buyFeature:(NSString *)featureId
{
    if ([SKPaymentQueue canMakePayments]) {
        SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObjects:featureId, nil]];
        request.delegate = nil;
        [request start];
    }
}
         
- (void) productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *products;
    
    products = response.products;
    
    SKPayment *payment = [SKPayment paymentWithProduct:[products objectAtIndex:0]];
    
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}
         
@end
