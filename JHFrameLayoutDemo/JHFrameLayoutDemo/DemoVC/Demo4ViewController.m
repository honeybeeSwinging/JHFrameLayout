//
//  Demo4ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/29.
//

#import "Demo4ViewController.h"
#import "JHFrameLayout.h"

@interface Demo4ViewController ()
@property (nonatomic,  strong) UILabel *label;
@end

@implementation Demo4ViewController

- (void)loadView{
    
    /**<
     
     This Demo tells you how to use 'UIView+JHFrameLayout' simplely.
     
     这个 Demo 简单地介绍了 'UIView+JHFrameLayout' 的使用
     
     */
    
    [super loadView];
    
    // updateWidth:YES
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"updateWidth:YES";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label1];
    _label = label1;
    
    [label1 jh_topIs:100];
    [label1 jh_leftIs:5];
    [label1 jh_heightIs:50];
    [label1 jh_widthIs:200];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"Click Me" forState:0];
    [button addTarget:self action:@selector(update) forControlEvents:1<<6];
    [self.view addSubview:button];
    
    [button jh_sizeIs:CGSizeMake(100, 50)];
    [button jh_centerIs:self.view.center];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"[label jh_rightIs:-5 fromRightOfView:self.view updateWidth:YES];";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.numberOfLines = 0;
    label2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label2];
    
    [label2 jh_topIs:CGRectGetMaxY(button.frame) + 10];
    [label2 jh_leftIs:5];
    [label2 jh_heightIs:100];
    [label2 jh_rightIs:-5];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Demo4";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)update
{
    /**<
     
     if you set 'updateWidth' YES, you will modify 'width'
     
     updateWidth 设置为 YES, 表示你要修改 width 的值
     */
    
    [UIView animateWithDuration:1 animations:^{
        [_label jh_rightIs:-5 fromRightOfView:self.view updateWidth:YES];
    }];
    
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
