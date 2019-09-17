//
//  ViewController.h
//  Mulithreading(downloadImage)
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *downloadImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *dowloadIndicator;
- (IBAction)downloadImagePressButton:(UIButton *)sender;


@end

