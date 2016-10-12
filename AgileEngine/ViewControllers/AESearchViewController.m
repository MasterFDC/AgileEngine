//
//  AESearchViewController.m
//  AgileEngine
//
//  Created by Tymur Tkachenko on 10/12/16.
//  Copyright © 2016 Tymur Tkachenko. All rights reserved.
//

#import "AESearchViewController.h"
#import "AEGalleryViewController.h"

static NSString * const keySegueShowGallery = @"SegueShowGallery";

@interface AESearchViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation AESearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:keySegueShowGallery]){
        
        AEGalleryViewController *vc = segue.destinationViewController;
        vc.searchTag = self.searchTextField.text;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.searchButton.enabled = text.length > 0;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self tapSearchButton:self.searchButton];
    
    return YES;
}

- (IBAction)tapSearchButton:(id)sender {
    
    [self.searchTextField resignFirstResponder];

    if (self.searchTextField.text.length > 0) {

        self.searchTextField.text = @"";

        [self performSegueWithIdentifier:keySegueShowGallery sender:self];
    }
}

@end
