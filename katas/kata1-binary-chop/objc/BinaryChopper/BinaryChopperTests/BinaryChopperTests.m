//
//  BinaryChopperTests.m
//  BinaryChopperTests
//
//  Created by Zach Dennis on 8/22/13.
//  Copyright (c) 2013 Zach Dennis. All rights reserved.
//

#import "BinaryChopperTests.h"

@implementation BinaryChopperTests {
  BinaryChopper *_chopper;
}

- (void)setUp
{
  [super setUp];
  _chopper = [[BinaryChopper alloc] init];
}

- (void)tearDown
{
  // Tear-down code here.
  [super tearDown];
}

#define ExpectNumberAtPositionInCollection(number, position, ...)\
  {\
  [self expect: number at: position in: __VA_ARGS__];\
  }

- (void) expect: (NSNumber *) number at: (NSNumber *) position in: (NSArray *) collection
{
  NSNumber *actualPosition = [_chopper chop: number in: collection];
  NSString *failureMessage =  [NSString stringWithFormat: @"Expected %@ to be found at index %@ in %@", number, position, collection];
  
  STAssertTrue([actualPosition isEqualToNumber: position], failureMessage);
}

- (void)testReturnsThePositionOfTheSearchTarget
{
  ExpectNumberAtPositionInCollection(@1, @0, @[@1]);
  
  ExpectNumberAtPositionInCollection(@1, @0, @[@1, @3, @5]);
  ExpectNumberAtPositionInCollection(@3, @1, @[@1, @3, @5]);
  ExpectNumberAtPositionInCollection(@5, @2, @[@1, @3, @5]);
  
  ExpectNumberAtPositionInCollection(@1, @0, @[@1, @3, @5, @7, @9, @11, @13, @15, @17]);
  ExpectNumberAtPositionInCollection(@3, @1, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@5, @2, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@7, @3, @[@1, @3, @5, @7]);
  
  ExpectNumberAtPositionInCollection(@1, @0, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@3, @1, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@5, @2, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@7, @3, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@9, @4, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@11, @5, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@13, @6, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@15, @7, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@17, @8, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@19, @9, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@21, @10, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
  ExpectNumberAtPositionInCollection(@23, @11, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
}

- (void) testReturnsNegativeOneWhenTheSearchTargetIsNotFound
{
  ExpectNumberAtPositionInCollection(@3, @-1, @[]);
  ExpectNumberAtPositionInCollection(@3, @-1, @[@1]);
  
  ExpectNumberAtPositionInCollection(@0, @-1, @[@1, @3, @5]);
  ExpectNumberAtPositionInCollection(@2, @-1, @[@1, @3, @5]);
  ExpectNumberAtPositionInCollection(@4, @-1, @[@1, @3, @5]);
  ExpectNumberAtPositionInCollection(@6, @-1, @[@1, @3, @5]);
  
  ExpectNumberAtPositionInCollection(@0, @-1, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@2, @-1, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@4, @-1, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@6, @-1, @[@1, @3, @5, @7]);
  ExpectNumberAtPositionInCollection(@8, @-1, @[@1, @3, @5, @7]);
  
  ExpectNumberAtPositionInCollection(@8, @-1, @[@1, @3, @5, @7, @9, @11, @13, @15, @17, @19, @21, @23]);
}

@end


