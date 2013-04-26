//
//  ViewController.h
//  Calculadora
//
//  Created by Guillem Fernández González on 16/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *equalsButton;
@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)digitPushed:(id)sender;

@end
