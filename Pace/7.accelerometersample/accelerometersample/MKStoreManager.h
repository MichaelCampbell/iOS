//
//  MKStoreManager.h
//  accelerometersample
//
//  Created by Michael Campbell on 2/18/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import Foundation;
@import StoreKit;

@interface MKStoreManager : NSObject <SKPaymentTransactionObserver>

- (void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions;

- (void) failedTransaction: (SKPaymentTransaction *)transaction;
- (void) completeTransaction: (SKPaymentTransaction *)transactions;
- (void) restoreTransaction: (SKPaymentTransaction *)transactions;

@end
