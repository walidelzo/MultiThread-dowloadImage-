//
//  ViewController.m
//  Mulithreading(downloadImage)
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic , strong) NSString *stringUrl;
@property (nonatomic , strong) NSURL *url ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _stringUrl  = @"https://www.michiganradio.org/sites/michigan/files/styles/x_large/public/201812/DSC_0151edit1.jpg";
    _url = [[NSURL alloc]initWithString:_stringUrl];
    
  //  self.downloadImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_url] ];
    [self.dowloadIndicator startAnimating];
    [self.dowloadIndicator setHidden:true];
   
}


- (IBAction)downloadImagePressButton:(UIButton *)sender {
    [self.dowloadIndicator setHidden:false];
    [[[NSURLSession sharedSession] dataTaskWithURL:_url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            // Multithread with GCD
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.downloadImageView.image = [UIImage imageWithData:data];
//                [self.dowloadIndicator stopAnimating];
//                [self.dowloadIndicator setHidden:true];
//            });
            
            //MultiThread with NSOperation
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.downloadImageView.image = [UIImage imageWithData:data];
                [self.dowloadIndicator stopAnimating];
                [self.dowloadIndicator setHidden:true];
            }];

        }
    }]resume] ;
}
@end
