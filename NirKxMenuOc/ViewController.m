//
//  ViewController.m
//  NirKxMenuOc
//
//  Created by Zin_戦 on 15/11/4.
//  Copyright © 2015年 zhan神. All rights reserved.
//

#import "ViewController.h"
#import "NirKxMenu.h"
#import "UIView+Extension.h"
@interface ViewController ()
{
    BOOL opsite;
    NSMutableArray *arr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIBarButtonItem *releaseButon=[[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(releaseInfo:)];
//    self.navigationItem.rightBarButtonItem=releaseButon;
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"首页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.width = 80;
    btn.height = 80;
    self.navigationItem.titleView = btn;
    [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    arr = [NSMutableArray array];
    
    [arr addObject:[KxMenuItem menuItem:@"扫一扫" image:[UIImage imageNamed:@"Touch"] target:self action:@selector(response:)]];
    [arr addObject:[KxMenuItem menuItem:@"加好友" image:[UIImage imageNamed:@"Touch"] target:self action:@selector(response:)]];
    [arr addObject:[KxMenuItem menuItem:@"发送到电脑" image:[UIImage imageNamed:@"Touch"] target:self action:@selector(response:)]];
    [arr addObject:[KxMenuItem menuItem:@"收钱" image:[UIImage imageNamed:@"Touch"] target:self action:@selector(response:)]];
    [arr addObject:[KxMenuItem menuItem:@"快传" image:[UIImage imageNamed:@"Touch"] target:self action:@selector(response:)]];
}
- (IBAction)Click:(UIButton *)sender {
    opsite = !opsite;
    if (opsite) {
        //配置一：基础配置
        [KxMenu setTitleFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    
    //配置二：扩展配置
        OptionalConfiguration p ;
        p.arrowSize = 9;//指示箭头大小
        p.marginXSpacing = 7;//MenuItem左右边距
        p.marginYSpacing = 9;//MenuItem上下边距
        p.intervalSpacing = 25;//MenuItemImage与MenuItemTitle的间距
        p.menuCornerRadius = 6.5;//菜单圆角半径
        p.maskToBackground = true;//是否添加覆盖在原View上的半透明遮罩
        p.shadowOfMenu = false;//是否添加菜单阴影
        p.hasSeperatorLine = true;//是否设置分割线
        p.seperatorLineHasInsets = false;//是否在分割线两侧留下Insets
    Color c = {1,1,1};
    Color tc = {0,0,0};
    p.menuBackgroundColor = c;//菜单的底色
    p.textColor = tc;//menuItem字体颜色
         [KxMenu showMenuInView:self.view fromRect:sender.frame menuItems:arr withOptions:p];
    }else
    {
        [KxMenu dismissMenu];
    }
    
}


- (void)releaseInfo:(UIButton *)sender {

    //配置一：基础配置
    [KxMenu setTitleFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    
    //配置二：扩展配置
    OptionalConfiguration p ;
    p.arrowSize = 9;//指示箭头大小
    p.marginXSpacing = 7;//MenuItem左右边距
    p.marginYSpacing = 9;//MenuItem上下边距
    p.intervalSpacing = 25;//MenuItemImage与MenuItemTitle的间距
    p.menuCornerRadius = 6.5;//菜单圆角半径
    p.maskToBackground = true;//是否添加覆盖在原View上的半透明遮罩
    p.shadowOfMenu = false;//是否添加菜单阴影
    p.hasSeperatorLine = true;//是否设置分割线
    p.seperatorLineHasInsets = false;//是否在分割线两侧留下Insets
    Color c = {1,1,1};
    Color tc = {0,0,0};
    p.menuBackgroundColor = c;//菜单的底色
    p.textColor = tc;//menuItem字体颜色
    
    [KxMenu showMenuInView:self.view fromRect:sender.frame menuItems:arr withOptions:p];
}

- (void)response:(UIButton *)sender
{
    NSLog(@"------%@",sender);
}

@end
