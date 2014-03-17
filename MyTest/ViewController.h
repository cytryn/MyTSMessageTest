//
//  ViewController.h
//  MyTest
//
//  Created by Andre Cytryn on 3/17/14.
//
//

#import <UIKit/UIKit.h>
#import <BSKeyboardControls/BSKeyboardControls.h>

@interface ViewController : UIViewController <BSKeyboardControlsDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *myTextField;

@end
