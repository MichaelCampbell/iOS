//
//  MKStoreManager.m
//  accelerometersample
//
//  Created by Michael Campbell on 2/18/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "MKStoreManager.h"

@implementation MKStoreManager

- (void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                break;
        }
    }
}

- (void) failedTransaction:(SKPaymentTransaction *)transaction
{
    
}

- (void) completeTransaction:(SKPaymentTransaction *)transactions
{
    
}

- (void) restoreTransaction:(SKPaymentTransaction *)transactions
{
    
}

@end
