//
//  ViewController.m
//  ScrollPhoto
//
//  Created by dym on 16/12/16.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "ViewController.h"
#import "XBScrollViewPhoto.h"
#import "XBWebImgManager.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSArray *imgsArray;
@end

@implementation ViewController

- (NSMutableArray*)imageArr{
    if (!_imageArr) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 1; i < 6; i++) {
            NSString *str = [NSString stringWithFormat:@"%i.jpg",i];
            [arr addObject:str];
        }
        
        _imageArr = arr;
    }
    return _imageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imgsArray = @[@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1482202570&di=5a7d92a9c182095a653eeb29974162fb&src=http://imgsrc.baidu.com/forum/pic/item/4ec2d5628535e5dd55d2464876c6a7efcf1b62af.jpg",
                       @"http://tupian.enterdesk.com/2013/mxy/12/10/15/3.jpg",
                       @"http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/01/0E/ChMkJlbKwaOIN8zJAAs5DadIS-IAALGbQPo5ngACzkl365.jpg",
                       @"http://image101.360doc.com/DownloadImg/2016/10/2813/83246025_16.jpg"];
    
    
    XBScrollViewPhoto *photo = [XBScrollViewPhoto scrollViewPhotoWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220) ImgsArray:self.imgsArray clickPhontIndex:^(NSInteger clickIndex) {
        NSLog(@"%ld ----",(long)clickIndex);
    }];
    photo.AutoScrollDelay = 0.7;
    photo.pageIndicatorTintColor = [UIColor yellowColor];
    photo.currentPageIndicatorTintColor = [UIColor grayColor];
    photo.placeImage = [UIImage imageNamed:@"22222.png"];
    [self.view addSubview:photo];
    
    [XBWebImgManager shareWebImgManager].DownloadImgRepeatCount = 5;;
}


@end
