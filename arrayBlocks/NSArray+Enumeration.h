//
//  NSArray+Enumeration.h
//  arrayBlocks
//
//  Created by Guang on 10/26/15.
//  Copyright © 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)

-(NSArray*) arrayByApplyingBlock:(id(^)(id object))block;
//-(NSArray *)elementsSatisfyingBlock:(BOOL (^)(NSUInteger testNumber))predicateBlock;
-(NSArray *)elementsSatisfyingBlock:(BOOL (^)(id testNumber))predicateBlock;

@end
