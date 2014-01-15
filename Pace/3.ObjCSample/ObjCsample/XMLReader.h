//
//  XMLReader.h
//  ObjCsample
//
//  Created by Michael Campbell on 1/14/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import Foundation;

@interface XMLReader : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableString *myValue;
@property (strong, nonatomic) NSMutableArray *arrDouble;

@property (strong, nonatomic) NSMutableDictionary *dictionary;

- (void) parseXMLFileWithData: (NSData *) myData
                   parseError: (NSError **) error;

@end
