//
//  DetailsViewController.m
//  CodeChallenge2
//
//  Created by GLBMXM0002 on 10/10/14.
//  Copyright (c) 2014 asda. All rights reserved.
//

#import "DetailsViewController.h"
#import "WikiViewController.h"

@interface  DetailsViewController()
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtState;

@end

@implementation DetailsViewController

- (void)viewDidLoad {

    self.txtCity.text = self.city.name;
    self.txtState.text = self.city.state;

}

//This method is intercepted when the segue (->) is added in the story board.
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //WikiViewController *wiki = [[WikiViewController alloc] init];
    
    WikiViewController *wiki = segue.destinationViewController;
    
    wiki.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    wiki.country = self.txtCity.text;
    
    //[self presentViewController:wiki animated:YES completion:^{[self animationCompleted];}];

}

- (void) animationCompleted {
    
}

@end