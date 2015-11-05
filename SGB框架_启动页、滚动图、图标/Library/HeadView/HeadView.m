//
//  HeadView.m
//  IBeiGuo
//
//  Created by SGB on 15/3/5.
//  Copyright (c) 2015年 山东广播电视台爱贝果母婴频道. All rights reserved.
//

#import "HeadView.h"


@implementation HeadView{
    UIScrollView *_headScrollView;
    UIPageControl *_pageControl;
    NSMutableArray *_headArray;//headView的数据源数组
    NSArray *_totalArray;//临时数组数组
    NSMutableArray *_imgeArray;//筛选图片数组  因为默认的图片太难看   筛选掉
    NSMutableArray *_IDArray;//筛选ID   一个ID  对应一个 图片
    NSTimer * _timer;//定时器
    NSInteger     _number;
    NSInteger     _count;
    NSMutableDictionary *_dic_ad;
    
}

singleton_implementation(HeadView)

+ (HeadView *)createHeadViewWithAd_position:(NSString *)ad_position
{
    
    HeadView *headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, PIC_SCROLL_HEIGHT) ad_position:ad_position];
    return headView;
}


- (id)initWithFrame:(CGRect)frame ad_position:(NSString *)ad_position
{
    self = [super initWithFrame:frame];
    if (self) {
        _headArray = [[NSMutableArray alloc]init];
        _dic_ad = [[NSMutableDictionary alloc]initWithObjectsAndKeys:ad_position,@"ad_position", nil];
        //设置head请求
        [self setHeadRequest];
    }
    return self;
}

//请求
- (void)setHeadRequest
{

    
//    API_ShopIndexGetAd
    [[ApiHelper sharedApiHelper] requestParamRemoveMsg:_dic_ad api_baseUrl:API_ShopIndexGetAd  completionHandler:^(id jsonObject) {
        
     
//
        for (NSDictionary *sucDict in jsonObject) {
            ShopADModel *model = [ShopADModel shopADWithDict:sucDict];
            [_headArray addObject:model];
        }
        _totalArray = [NSMutableArray arrayWithArray:jsonObject];

        [self createHeadScrollView];
    } errorHandler:^{
        
    }];

}

//创建_headScrollView
- (void)createHeadScrollView
{

    _headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, PIC_SCROLL_HEIGHT)];
    _headScrollView.contentSize = CGSizeMake(_headArray.count*ScreenWidth, PIC_SCROLL_HEIGHT);
    _headScrollView.tag = 0;
    _headScrollView.delegate = self;
    _headScrollView.bounces = NO;
    _headScrollView.showsHorizontalScrollIndicator = NO;
    
    
    _imgeArray = [[NSMutableArray alloc]init];
    _IDArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < _headArray.count; i++) {
        ShopADModel *model = _headArray[i];
        [_imgeArray addObject:model.ad_img];
        [_IDArray addObject:[NSString stringWithFormat:@"%@",model.ad_value]];
    }
    
    for (int i = 0; i < _headArray.count; i++) {
        
        UIImageView *imgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, PIC_SCROLL_HEIGHT)];
        imgImageView.tag  = i;
        [imgImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_imgeArray[i]]] placeholderImage:[UIImage imageNamed:@"sc_commodity"]];
        [imgImageView imageViewTapWithtarget:self act:@selector(tap:)];
        
        _headScrollView.contentOffset = CGPointMake(i*ScreenWidth, 0);
        _headScrollView.pagingEnabled = YES;
        [_headScrollView addSubview:imgImageView];
        
    }
    _headScrollView.contentOffset = CGPointMake(0, 0);
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(ScreenWidth/3, PIC_SCROLL_HEIGHT-30, ScreenWidth/3, 30)];
    _pageControl.numberOfPages = _headArray.count;
    _count = 0;
    _number = _headArray.count;
    
    
    _pageControl.currentPage = 0;
    
    
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_headScrollView];
    [self addSubview:_pageControl];

    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                              target:self
                                            selector:@selector(scrollTheImg)
                                            userInfo:nil
                                             repeats:YES];
    
    
    
}
#pragma mark - 点击事件
//tap点击
- (void)tap:(UITapGestureRecognizer *)tap
{
    
//    //在这里判断_headScrollView.contentOffset.x  或者_PageControl.currentPage都可以进行判断
//     NSString *headID =  [NSString stringWithFormat:@"%@",_IDArray[tap.view.tag]];
    NSDictionary *dic = _totalArray[tap.view.tag];
    self.block(dic);
    
}

- (void)pageControlClick:(UIPageControl *)page
{
    _headScrollView.contentOffset = CGPointMake(page.currentPage*ScreenWidth, 0);
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    
    if (scrollView.tag == 0) {
        
        if (_pageControl.currentPage == _headArray.count-1) {
            _pageControl.currentPage = 0;
            scrollView.contentOffset = CGPointMake(0, 0);
        }else{
            _pageControl.currentPage = scrollView.contentOffset.x/ScreenWidth;
        }
    }
    
 
}

#pragma mark - 定时器的问题
- (void)scrollTheImg
{
    if(_count == _number)
    {
        _count = 0;
    }
    if(_count < _number)
    {
        _headScrollView.contentOffset = CGPointMake(ScreenWidth*_count, 0);
        _pageControl.currentPage = _count;
        _count++;
    }
}

@end

