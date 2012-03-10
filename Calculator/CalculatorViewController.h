//
//  CalculatorViewController.h
//  Calculator
//
//  Created by aaron on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic, strong)   NSString *lastOperator;
@end
