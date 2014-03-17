//
//  ViewController.m
//  MyTest
//
//  Created by Andre Cytryn on 3/17/14.
//
//

#import "ViewController.h"
#import <TSMessages/TSMessage.h>

@interface ViewController ()

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // BSKeyboardControls submodule
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:@[self.myTextField]]];
    [self.keyboardControls setDelegate:self];
    [self.keyboardControls setDoneTitle:@"Close"];
}

#pragma mark - Action

- (IBAction)buttonTapped
{
    if (self.myTextField.text.length) {
        NSLog(@"It has content");
    } else {
        [TSMessage showNotificationInViewController:self
                                              title:@"Foo"
                                           subtitle:@"bar"
                                               type:TSMessageNotificationTypeWarning
                                           duration:TSMessageNotificationDurationAutomatic];
    }
}



#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 1) return;
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    if (!CGRectContainsPoint(self.myTextField.frame, touchPoint)) {
        //touch originated outside textField.
        [self.myTextField resignFirstResponder];
    }
}


#pragma mark - UITextfield Delegate

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
    [self.keyboardControls setActiveField:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animateTextField:textField up:NO];
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    int movementDistance = -220;
    
    const float movementDuration = 0.3f;
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}




#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
