//
//  MovieDetailViewController.m
//  Rotten Tomatoes
//
//  Created by Austin Oh on 1/26/15.
//  Copyright (c) 2015 Austin Oh. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text =self.movie[@"synopsis"];
    [self.synopsisLabel sizeToFit];

    NSDictionary *posterDict = self.movie[@"posters"];
    NSString *url = [posterDict valueForKey:@"original"];
    url = [url stringByReplacingOccurrencesOfString:@"_tmb" withString:@"_ori"];
    
    [self.posterView setImageWithURL:[NSURL URLWithString:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
