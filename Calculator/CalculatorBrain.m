//
//  CalculatorBrain.m
//  Calculator
//
//  Created by aaron on 12-3-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void)pushOperand:(double)operand
{
    
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    
}
-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
-(double)performOperation:(NSString *)operation
{
    double result = 0;
    //if (self.operandStack 
    if ([operation isEqualToString:@"+"]) {
        result =[self popOperand] + [self popOperand];
    }else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    }else if ([@"-" isEqualToString:operation]) {
        double myBackNumber = [self popOperand];
        double  myFrontNumber = [self popOperand];
        result = myFrontNumber - myBackNumber;
    }else if ([@"/" isEqualToString:operation]) {
        double myDivisor = [self popOperand];
        double myDividend = [self popOperand];
        result =  myDividend/myDivisor;
    }
    
    [self pushOperand:result];
    return result;
}
-(void)clearOperand
{
    [self.operandStack removeAllObjects];

}@end
