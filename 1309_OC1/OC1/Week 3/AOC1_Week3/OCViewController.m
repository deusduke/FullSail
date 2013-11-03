//
//  OCViewController.m
//  AOC1_Week3
//  1309
//
//  Created by Deus Duke on 9/18/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // variable declerations
    NSInteger number1 = 2;
    NSInteger number2 = 2;
    NSInteger sum = [self Add:number1 :number2];
    NSNumber *number = [NSNumber numberWithInt:sum];
    NSString *numberString = [number stringValue];
    
    NSString *alertMessage = [self Append:@"This " :@"appears to be working!!!"];
    NSString *numberMessage = [NSString stringWithFormat:@"The number is %@",  numberString];
    
    NSString *compareMessage = @"These integers are not equal :(";
    
    
    // do the work
    if ([self Compare:number1 :number2])
    {
        compareMessage = [NSString stringWithFormat:@"%i and %i are equal!!!!", number1, number2];
    }
    
    [self DisplayAlertWithString:alertMessage];
    [self DisplayAlertWithString:numberMessage];
    [self DisplayAlertWithString:compareMessage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) Add:(NSInteger)firstValue :(NSInteger)secondValue
{
    return firstValue + secondValue;
}

- (Boolean) Compare:(NSInteger)firstValue :(NSInteger)secondValue
{
    return firstValue == secondValue ? YES : NO;
}

- (NSString*) Append:(NSString *)firstString :(NSString *)secondString
{
    NSMutableString *mString = [NSMutableString stringWithString:firstString];
    [mString appendString:secondString];

    return mString;
}

- (void) DisplayAlertWithString:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Display Alert With String" message:message delegate:nil cancelButtonTitle:@"Got It" otherButtonTitles:nil, nil];
    
    [alertView show];
}

@end
