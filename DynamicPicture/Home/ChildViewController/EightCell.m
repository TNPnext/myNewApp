//
//  EightCell.m
//  DynamicPicture
//
//  Created by TNP on 2017/4/19.
//  Copyright © 2017年 重庆瓦普时代网络科技有限公司. All rights reserved.
//

#import "EightCell.h"

@implementation EightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //[self setSafeBackgroundColor:RGB(242, 243, 244)];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(35, 0, 180, 30);
        _title.font = [UIFont systemFontOfSize:19];
        _title.textColor = [UIColor blackColor];
        _title.text = @"第1795858期";
        _title.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_title];
        
        _datas = [[UILabel alloc] init];
        _datas.frame = CGRectMake(190, 0, 100, 30);
        _datas.font = [UIFont systemFontOfSize:14];
        _datas.textColor = [UIColor grayColor];
        _datas.text = @"2017-12-30";
        _datas.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_datas];
        
        _bigV = [[UIView alloc] init];
        _bigV.frame = CGRectMake(35, 40, kMainWidth, 40);
        [self.contentView addSubview:_bigV];
        
        for (int i = 0; i<8; i++)
        {
            UILabel *numberL = [[UILabel alloc] init];
            numberL.frame = CGRectMake((25+5)*i, 0, 25, 25);
            numberL.clipsToBounds = YES;
            numberL.layer.cornerRadius = 25/2;
            numberL.font = [UIFont systemFontOfSize:15];
            numberL.textColor = [UIColor whiteColor];
            numberL.text = @"9";
            numberL.textAlignment = NSTextAlignmentCenter;
            numberL.tag = i;
            numberL.backgroundColor = [UIColor hexStringToColor:KNavBarHexColor];
            [_bigV addSubview:numberL];
        }
        
    }
    return self;
}
-(void)setModel:(CategoryModel *)model
{
    NSMutableArray *arrs = [[NSMutableArray alloc]init];
    _title.text =[model.isHistory boolValue]?[NSString stringWithFormat:@"第%@期",model.issue]:model.cn;
    _datas.text = [NSString stringWithFormat:@"%@",model.date];
    NSArray *dataA = [model.code componentsSeparatedByString:@","];
    [arrs addObjectsFromArray:dataA];
    [arrs removeLastObject];
    NSString *last = [dataA lastObject];
    NSArray *dataB = [last componentsSeparatedByString:@"#"];
    [arrs addObjectsFromArray:dataB];
    for (UILabel *L in _bigV.subviews)
    {
        L.text = arrs[L.tag];
        L.clipsToBounds = YES;
        L.layer.cornerRadius = 25/2;
        if ([model.cn isEqualToString:@"七乐彩"] &&L.tag==7)
        {
            L.backgroundColor = [UIColor blueColor];
        }
    }
}

@end
