//
//  ViewController.m
//  guessMath
//
//  Created by 張峻綸 on 2016/5/7.
//  Copyright © 2016年 張峻綸. All rights reserved.
//

#import "ViewController.h"
#import "guseeMathTableViewController.h"
#import "Round.h"
@interface ViewController ()
//讓使用者輸入數字的UITextField
@property (weak, nonatomic) IBOutlet UITextField *inputMath;
//輸出到螢幕的UITextView
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
//@property (strong, nonatomic) Round * summ;


@end

@implementation ViewController
- (IBAction)history:(UIButton *)sender {
    //取得文字框的文字,準備傳給下一頁
    
    //準備下一頁
    guseeMathTableViewController * second =(guseeMathTableViewController*)
    [self.storyboard instantiateViewControllerWithIdentifier:@"guseeMathTableViewController"];
    
    second.guessInput=aaa;
    second.compare=checkNumber;
    
    //顯示下一頁
//    [self presentViewController:second animated:YES completion:nil];
    [self.navigationController pushViewController:second animated:YES];
    
}
- (IBAction)guessMath:(UIButton *)sender {
    
    //判斷輸入的是否為四個數字,不是的話請使用者重填
    if(self.inputMath.text.length ==4){
        
        //接收輸入字串並且創建guessMath的可變動陣列
        NSString * guessMath =self.inputMath.text;
        NSMutableArray * guessArray=[[NSMutableArray alloc]init];
        [aaa addObject:guessMath];
        //把接收的字串轉為陣列
        guessArray=[self getGuessMath:guessMath];
        
        //判斷輸入的字串是否有重複,有的話請使用者重填
        if([guessArray[0] isEqualToString:guessArray[1]]||[guessArray[0]    isEqualToString:guessArray[2]]||[guessArray[0] isEqualToString:guessArray[2]]||[guessArray[0] isEqualToString:guessArray[3]]||[guessArray[1] isEqualToString:guessArray[2]]||[guessArray[1] isEqualToString:guessArray[3]]||[guessArray[2] isEqualToString:guessArray[3]]){
            
            //把label輸入框設為空字串,並請使用者重新輸入4個不重複的數字
            self.inputMath.text=@"";
            self.resultLabel.text=@"請輸入4個不重複的數字";
        }
        
        else{
            //判斷輸入的數字為幾a幾b
            [checkNumber addObject:[self compareNumber:guessArray]];
//            b=[self numberWithb:guessArray];
    
            //判斷是否猜測正確
            if([guessArray isEqual:randomArray]){
                
                //建立字串bingo內容為猜測次數及數字答案
                NSString* bingo=[NSString stringWithFormat:@"第%i次猜測答對,答案為:%@%@%@%@ ",number,randomArray[0],randomArray[1],randomArray[2],randomArray[3]];
                
                
                //把訊息輸出到UITextView上
                self.resultLabel.text=bingo;
                randomArray=[self creatRandomMath:randomArray];
                number=1;
                
            }else{
                //建立字串內容為猜測次數及幾a幾b
                NSString* outputTmp=[NSString stringWithFormat:@"第%i次猜測為 %@ ",number,[checkNumber objectAtIndex:(number-1)]];
                
                //把錯誤訊息累加到輸出的變數output
              
                
                //把訊息輸出到UITextView上
                self.resultLabel.text=outputTmp;
                
                //猜測錯誤猜測次數+1
                number+=1;
            }
        }
        
    }else{
        //輸入的數字不是四個數字,把label輸入框設為空字串,並請使用者重新輸入4個不重複的數字
        self.inputMath.text=@"";
        self.resultLabel.text=@"請輸入4個不重複的數字";
   }
}

- (IBAction)answerMath:(UIButton *)sender {
    
    //建立字串answer內容為猜測次數及數字答案
    NSString* answer=[NSString stringWithFormat:@"答案為:%@%@%@%@ 請重新開始猜測新的數字",randomArray[0],randomArray[1],randomArray[2],randomArray[3]];
    
    //猜測正確訊息累加到輸出的變數output
    
//    [aaa addObject:answer];
    //把訊息輸出到UITextView上
    self.resultLabel.text=answer;
    
    randomArray=[self creatRandomMath:randomArray];
    number=1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化可變動字串output,作用為把訊息輸出到UITextView上
    output=[[NSMutableString alloc]init];
    checkNumber=[[NSMutableArray alloc]init];
    aaa=[[NSMutableArray alloc]init];
    //猜測次數初始為1
    number=1;
    
    //創建可變動矩陣 並判斷矩陣內4個數字不相同
    randomArray=[[NSMutableArray alloc]init];
    
    
    
    //判斷randomArray矩陣內四個數字是否有重複,如有讓randomArray矩陣變成不重複的矩陣
    randomArray=[self creatRandomMath:randomArray];
    
    //測試類別陣列是否能給值
    summ.sum=[[NSMutableArray alloc]init];
    [summ.sum addObject:@"test"];
    NSLog(@"%@",summ.sum);
    

}

-(NSMutableArray*)creatRandomMath:(NSMutableArray*)array{
    
    for (int i=0; i<4; i++)
    {
        array[i]=[NSString stringWithFormat:@"%i",arc4random()%10];
    }
    
    for(int i=0;i<4;i++){
//        NSLog(@"i等於=%i",i);
        for(int j=0;j<4;j++){
//            NSLog(@"j=%i",j);
            NSString * tmp=array[j];
            if(i!=j){
                while( [tmp isEqualToString:array[i]]){
//                     NSLog(@"進入迴圈%i",j);
                    array[i]=[NSString stringWithFormat:@"%i",arc4random()%10];
                    j=-1;
                }
            }
        }
    }
    
    //輸出題目randomArray---測試用
    NSLog(@"%@",array);
    return array;
}

-(NSMutableArray*)getGuessMath:(NSString*)string{
    
    //把使用者輸入的四個數字的字串逐一輸入到陣列裡
    NSMutableArray * getArray=[[NSMutableArray alloc]init];
    for(int i=0;i<4;i++){
        //substringWithRange:NSMakeRange(i,1) 第i個字元開始,擷取第一個字元
        getArray[i] = [string substringWithRange:NSMakeRange(i,1)];
    }
    return getArray;
}

-(NSString *)compareNumber:(NSMutableArray*)array{
    
    int a=0,b=0;
    for(int i=0;i<4;i++)
    {
        for(int j=0;j<4;j++)
        {
            if(i==j&&[array[i] isEqualToString: randomArray[j]])
            {
                a=a+1;
            }
            else if([array[i] isEqualToString: randomArray[j]])
            {
                b=b+1;
            }
        }
    }
    NSString* c=[NSString stringWithFormat:@"A:%i B:%i",a,b];
    return c;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    segue.identifier == @"A"
//    
//    guseeMathTableViewController *gmtvc = segue.destinationViewController;
//    
//    gmtvc.guessInput=aaa;
//    gmtvc.compare=checkNumber;
//}

@end
        
