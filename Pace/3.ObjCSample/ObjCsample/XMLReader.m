//
//  XMLReader.m
//  ObjCsample
//
//  Created by Michael Campbell on 1/14/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "XMLReader.h"

@implementation XMLReader

- (id) init
{
    self = [super init];
    
    if (self) {
        self.dictionary = [[NSMutableDictionary alloc] init];
        self.arrDouble = [[NSMutableArray alloc] init];
        
        [self.dictionary setObject:self.arrDouble
                            forKey:@"double"];
    }
    
    return self;
}

- (void) parseXMLFileWithData:(NSData *)myData parseError:(NSError *__autoreleasing *)error
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:myData];
    [parser setDelegate:self];
    [parser parse];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    self.myValue = [NSMutableString string];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSMutableArray *array = [self.dictionary objectForKey:elementName];
    [array addObject:self.myValue];
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.myValue) {
        [self.myValue appendString:string];
    }
}

@end
