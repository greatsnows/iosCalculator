//
//  CalculatorBrain.h
//  Calculator
//
//  Created by aaron on 12-3-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(void)clearOperand;
-(double)performOperation:(NSString *)operation;
@end
