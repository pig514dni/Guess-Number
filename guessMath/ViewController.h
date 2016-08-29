//
//  ViewController.h
//  guessMath
//
//  Created by 張峻綸 on 2016/5/7.
//  Copyright © 2016年 張峻綸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"
@interface ViewController : UIViewController
{
    //宣告全域變數的地方
    NSMutableArray * randomArray;
    NSMutableString* output;
    int number;
    NSMutableArray * checkNumber;
    NSMutableArray * aaa;
    Round* summ;
}
@end

