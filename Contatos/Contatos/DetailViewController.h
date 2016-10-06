//
//  DetailViewController.h
//  Contatos
//
//  Created by Hugo Schneider on 8/25/16.
//  Copyright © 2016 Hugo Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

