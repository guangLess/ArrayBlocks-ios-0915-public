//
//  NSArray+Enumeration.m
//  arrayBlocks
//
//  Created by Guang on 10/26/15.
//  Copyright © 2015 Zachary Drossman. All rights reserved.
//

#import "NSArray+Enumeration.h"

@implementation NSArray (Enumeration)

-(NSArray *)arrayByApplyingBlock:(id (^)(id))block
{
    // output
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];// just to put it here
    
    for (id object in self)
    {
        // yeild to the block, get its output
        id result = block(object);

        // add output to resultArray
        [resultArray addObject: result];
    }
    // return results!
    return resultArray;
}


//-(NSArray *)elementsSatisfyingBlock:(BOOL (^)(NSUInteger testNumber))predicateBlock{
-(NSArray *)elementsSatisfyingBlock:(BOOL (^)(id object))predicateBlock{

    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    
    for (id object in self) {
    
        //NSUInteger result = [testNumber integerValue];
        //BOOL passesBlock = predicateBlock(testNumber);
        if (predicateBlock(object)){
            [resultArray addObject:object];
        }
    }
    return  resultArray;
}

@end
