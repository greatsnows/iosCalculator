//
//  CalculatorViewController.m
//  Calculator
//
//  Created by aaron on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
//@property (nonatomic) BOOL itIsTheFirstTypeOfNumber;
@property (nonatomic, strong) CalculatorBrain * brain;
@end


@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize lastOperator = _lastOperator;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
/*
-(NSString *)lastOperator
{
    if (!_lastOperator) _lastOperator
}*/
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [ sender currentTitle];


    if (self.userIsInTheMiddleOfEnteringANumber ){
        self.display.text = [self.display.text stringByAppendingString:digit];
      
    }else if (digit == 0){
        
    }else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
        
}


- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self.brain pushOperand:[self.display.text doubleValue]];
        self.userIsInTheMiddleOfEnteringANumber = NO;
    }
    	
    if(_lastOperator){
    double result = [self.brain performOperation:_lastOperator];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];

    self.display.text = resultString;
    }
    _lastOperator = sender.currentTitle;    
}
- (IBAction)clearPressed {
    [self.brain clearOperand];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    _lastOperator = nil;
    self.display.text = @"0";
}
- (IBAction)equalPressed {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self.brain pushOperand:[self.display.text doubleValue]];
        self.userIsInTheMiddleOfEnteringANumber = NO;
    }
    
    if(_lastOperator){
        double result = [self.brain performOperation:_lastOperator];
        NSString *resultString = [NSString stringWithFormat:@"%g", result];
        
        self.display.text = resultString;
    }
    
    _lastOperator = nil;   
}

@end
