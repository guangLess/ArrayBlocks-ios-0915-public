//
//  ViewController.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Enumeration.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];

    
 //----one--->
    NSArray * testArray = @[@"3",@"6",@"1",@"0",@"7",@"8"];
    NSLog(@"%@", testArray);
    
    NSArray *modifiedArray = [testArray arrayByApplyingBlock:^id(id object) {
       // NSString *newString = [(NSString*)object stringByAppendingString:@" is awesome!"];
        NSUInteger stringInNumberValue = [object integerValue] * 2;
        NSString * newString = [NSString stringWithFormat:@"%lu",stringInNumberValue];
        return newString;
    }];
    
    NSLog(@"two times --->%@", modifiedArray);
    
    //----two--->
    NSArray * newArray = [testArray elementsSatisfyingBlock:^BOOL(NSUInteger testNumber) {
        NSUInteger evenNumber = testNumber % 2 ==0 ;
        return evenNumber;
    }];
    
    NSLog(@"even Number %@", newArray);
    
    }
@end

