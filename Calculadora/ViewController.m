//
//  ViewController.m
//  Calculadora
//
//  Created by Guillem Fernández González on 16/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int _operand1;       // Primer operando
    int _operand2;       // Segundo operando
    int _operation;      // Operación en curso
                        /*
                         0 - Ninguna operación
                         1 - Suma
                         2 - Resta
                         3 - Multiplicación
                         4 - División
                         */
    BOOL showResult;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Initialize variables
    _operand1 = 0;
    _operand2 = 0;
    _operation = 0; // No opearation
    showResult = NO;
    
    [_equalsButton addTarget:self action:@selector(digitPushed:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDisplay
{
    if (showResult == NO) {
        if (_operation == 0) {
            _display.text = [NSString stringWithFormat:@"%d", _operand1];
        } else {
            _display.text = [NSString stringWithFormat:@"%d", _operand2];
        }
    } else {
        int result;
        
        switch (_operation) {
            case 1: // Suma
                result = _operand1 + _operand2;
                break;
            case 2: // Resta
                result = _operand1 - _operand2;
                break;
            case 3: // Suma
                result = _operand1 * _operand2;
                break;
            case 4: // Suma
                result = _operand1 / _operand2;
                break;
            default:
                result = 0;
                break;
        }
        _display.text = [NSString stringWithFormat:@"%d", result];
        _operand1 = 0;
        _operand2 = 0;
        _operation = 0;
        showResult = NO;
    }
    
}

- (void)setOperandAndUpdateDisplayWithNumber:(int)number
{
    if (_operation == 0) {
        _operand1 = number;
    } else {
        _operand2 = number;
    }
    
    [self updateDisplay];
}

- (IBAction)digitPushed:(id)sender {
    
    UIButton *currentButton = (UIButton *)sender;
    NSString *buttonText = currentButton.titleLabel.text;
    
    if ([buttonText isEqualToString:@"+"]) {
        _operation = 1;
    } else if ([buttonText isEqualToString:@"-"]){
        _operation = 2;
    } else if ([buttonText isEqualToString:@"x"]){
        _operation = 3;
    } else if ([buttonText isEqualToString:@"/"]){
        _operation = 4;
    } else if ([buttonText isEqualToString:@"="]){
        if (_operation != 0) {
            showResult = YES;
            [self updateDisplay];
            
        }
    } else {
        int currentValue = [buttonText intValue];
        [self setOperandAndUpdateDisplayWithNumber:currentValue];
    }
    
    if (_operation != 0) {
        _equalsButton.backgroundColor = [UIColor greenColor];
    } else {
        _equalsButton.backgroundColor = [UIColor whiteColor];
    }
}

@end
