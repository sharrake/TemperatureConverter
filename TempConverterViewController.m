//
//  TempConverterViewController.m
//  TemperatureConverter
//
//  Created by Rakesh Sharma on 8/5/13.
//  Copyright (c) 2013 Yahoo. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()
@property(nonatomic, strong) NSString *lastSelected;
@property(nonatomic) BOOL isAlreadyDisplayed;
@end

@implementation TempConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.isAlreadyDisplayed = false;
    self.celsiusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButtonClicked:(id)sender {
    
    if([self.lastSelected isEqualToString: @"Celsius"]){
        float celsius = [self.celsiusTextField.text floatValue];
        float fahrenheit = celsius * 9/5 + 32;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f",fahrenheit ];
        
        
    } else if([self.lastSelected isEqualToString: @"Fahrenheit"]) {
        float fahrenheit = [self.fahrenheitTextField.text floatValue];
        float celsius =  (fahrenheit -32)* 5 /9;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f",celsius ];    }
}

#pragma UITextFieldDelegate Methods
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    self.isAlreadyDisplayed = true;
    return YES;
}



-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if(self.celsiusTextField == textField) {
        self.lastSelected = @"Celsius";
    } else if(self.fahrenheitTextField == textField) {
        self.lastSelected =@"Fahrenheit";
    }
    return YES;
}

#pragma private methods
- (void) onDoneButton
{
    [self.view endEditing:YES];
    
}

@end
