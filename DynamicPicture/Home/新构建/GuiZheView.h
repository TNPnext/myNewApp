//
//  GuiZheView.h
//  CaiPiaoApp
//
//  Created by TNP on 2017/5/19.
//  Copyright © 2017年 重庆瓦普时代网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^btn)(NSInteger index);
@interface GuiZheView : UIView
@property(nonatomic,copy) btn btnBlock;
-(void)showView;
-(void)dismissView;
@end
