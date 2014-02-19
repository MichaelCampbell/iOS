//
//  MKStoreHandler.h
//  accelerometersample
//
//  Created by Michael Campbell on 2/18/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import Foundation;
@import StoreKit;
#import "MKStoreManager.m"

@interface MKStoreHandler : NSObject <SKProductsRequestDelegate>

@property (nonatomic, strong) MKStoreManager *storeManager;

+ (MKStoreHandler *) sharedHandler;

- (void) buyFeature: (NSString *)featureId;

@end
