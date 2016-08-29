//
//  guseeMathTableViewController.h
//  guessMath
//
//  Created by 張峻綸 on 2016/5/9.
//  Copyright © 2016年 張峻綸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface guseeMathTableViewController : UITableViewController
@property(nonatomic,strong)NSMutableArray * compare;
@property(nonatomic,strong)NSMutableArray* guessInput;
@property(nonatomic,strong)NSMutableArray * history;
@end
