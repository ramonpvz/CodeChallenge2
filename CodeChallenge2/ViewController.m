//
//  ViewController.m
//  CodeChallenge2
//
//  Created by GLBMXM0002 on 10/10/14.
//  Copyright (c) 2014 asda. All rights reserved.
//

#import "ViewController.h"
#import "City.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cities = [[NSMutableArray alloc] init];
    
    City *vancouver = [[City alloc] initWithName:@"Vancouver"];
    vancouver.state = @"British Columbia";
    [self.cities addObject:vancouver];
 
    City *nashville = [[City alloc] initWithName:@"Nashville"];
    nashville.state = @"Tennessee";
    [self.cities addObject:nashville];

    City *mexico = [[City alloc] initWithName:@"Mexico"];
    mexico.state = @"Mexico";
    [self.cities addObject:mexico];
    
    City *frankfurt = [[City alloc] initWithName:@"Frankfurt"];
    frankfurt.state = @"Hessen";
    [self.cities addObject:frankfurt];
    
//    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeGestureHandler)];
//    [recognizer setDirection: (UISwipeGestureRecognizerDirectionLeft)];
//    [self.tableView addGestureRecognizer:recognizer];
//    [recognizer release];
    
}

- (IBAction) swipeGestureHandler:(UIGestureRecognizer *)gestureRecognizer {
    
    //Get location in swipe
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    
    //Get the corresponding index path within the table view
    NSIndexPath *indextPath = [self.tableView indexPathForRowAtPoint: location];
    
    //Check if indexPath is valid
    if (indextPath) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indextPath];
        for (City *city in self.cities) {
            if ([city.name isEqualToString: cell.textLabel.text]) {
                [self.cities removeObject:city];
                break;
            }
        }
        [self.tableView reloadData];
    }

}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCellID" forIndexPath:indexPath];
    
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.name;
    return cell;

}

@end