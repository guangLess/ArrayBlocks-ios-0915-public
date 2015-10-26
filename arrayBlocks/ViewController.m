//
//  ViewController.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    /*
    [testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        NSLog(@"%@",@([(NSNumber *)obj integerValue] +1));
    }];
    
    NSPredicate *evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary<NSString *,id> * bindings) {
        return [evaluatedObject integerValue] % 2 ==0 ;
    }];
    NSArray * filteredArray = [testArray filteredArrayUsingPredicate:evenPredicate];
    NSLog(@"%@",filteredArray);
    */
    
    NSArray * testArray = @[@"3",@"6",@"1",@"0",@"7",@"8"];

    __block NSUInteger idx = 0;
    NSArray * evenNumber = [self elementsSatisfyingBlock:testArray passingEvenBlocks:^BOOL(NSUInteger testNumber) {
        BOOL evenNumber = idx % 2 == 0;
        idx ++ ;
        return evenNumber;
    }];
    
    NSLog(@"even Numbers from the block is {%@",evenNumber);
    
    NSArray * arrayBlock = [self arrayByApplyingBlock:testArray multiple:2 mutliple:^(NSArray *numberArray, NSUInteger multiNumber) {
        //NSLog(@"result in Array is %@",numberArray);
    }];
    
    NSLog(@" arrayBlock {%@} ", arrayBlock);
}


-(NSArray *)arrayByApplyingBlock:(NSArray *)startingArray multiple:(NSUInteger )x mutliple:(void(^) (NSArray * numberArray, NSUInteger multiNumber ))arrayByApplyingBlock{
    
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];// just to put it here
    for (NSString * eachNumString in startingArray) {
        NSUInteger  result = eachNumString.intValue * 2;
        [resultArray addObject:[NSString stringWithFormat:@"%lu",result]];
        arrayByApplyingBlock(resultArray,x);
    }
    
    return resultArray;
}

-(NSArray *)elementsSatisfyingBlock:(NSArray *)stringNumber passingEvenBlocks:(BOOL (^)(NSUInteger testNumber))predicateBlock{
    
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    for (NSString * eachNumString in stringNumber) {
        NSUInteger  result = eachNumString.intValue;
        NSUInteger testNumber = result;
        if (predicateBlock(testNumber)){
            [resultArray addObject:[NSString stringWithFormat:@"%lu",(unsigned long)result]];
        }
    }
    return  resultArray;
}

@end



/*
 -(NSArray *)charactersInString:(NSString *)string passingTest:(BOOL (^)(NSString *character))predicateBlock
 {
 NSMutableArray *winningCharacters = [[NSMutableArray alloc] init];
 
 NSArray *characters = [self arrayWithCharactersOfString:string];
 
 for(NSUInteger i = 0; i < characters.count; i++) {
 NSString *character = characters[i];
 if(predicateBlock(character)) {
 [winningCharacters addObject:character];
 }
 }
 
 return winningCharacters;
 }
 
 -(NSString *)characterOfString:(NSString *)string atIndex:(NSUInteger)index
 {
 unichar nthCharacterAsUnichar = [string characterAtIndex:index];
 return [NSString stringWithFormat:@"%C", nthCharacterAsUnichar];
 }
 
 -(NSArray *)arrayWithCharactersOfString:(NSString *)string
 {
 NSMutableArray *lettersInString = [[NSMutableArray alloc] init];
 
 for(NSUInteger i = 0; i < string.length; i++) {
 NSString *characterAtIndex = [self characterOfString:string atIndex:i];
 [lettersInString addObject:characterAtIndex];
 }
 
 return lettersInString;
 }
 
 
 
 */


