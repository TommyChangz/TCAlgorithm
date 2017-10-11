//
//  ViewController.m
//  TCAlgorithmsSummary
//
//  Created by TC on 2017/10/11.
//  Copyright © 2017年 Tommy Chang. All rights reserved.
//

#include "Algorithm.h"

#import "ViewController.h"
#import "TCCollectionViewCell.h"



#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define margin 10
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,strong) NSMutableArray *source;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _flowLayout.itemSize = CGSizeMake((ScreenWidth-margin*2)/3, (ScreenWidth-margin*2)/3);
    _flowLayout.minimumInteritemSpacing = margin;
    _flowLayout.minimumLineSpacing = margin;
    
    self.source = [NSMutableArray arrayWithArray:@[@"快排",@"二分查找",@"冒泡排序"]];
    [_collectionView registerNib:[UINib nibWithNibName:@"TCCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collCell"];
                    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (__kindof TCCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    if (indexPath.row<self.source.count) {
        cell.titleLabel.text = self.source[indexPath.row];

    }
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
            [self quickSortTest];
            break;
        case 1:
            [self midSearchTest];
            break;
        case 2:
            [self bubbleTest];
            break;
            
        default:
            break;
    }
    
}
- (void)quickSortTest{
    int array[]={4,1,5,7,9,2,10,3,0,8,6};
    
    quickSort(array, 0, 10);
    for (int i = 0; i<=10; i++) {
        printf("%d\n",array[i]);
    }
}

- (void)midSearchTest{
    
    int array[] ={0,5,6,10,23,25,36,47};
    int mark = binarySearch(array, 8, 25);
    
    printf("aim:%d",mark);
}

-(void)bubbleTest{
    
    int arrBubble[] = {2,4,0,1,56,23,9,7,5};
    bubbleSort(arrBubble, 9);
    
    for (int i = 0; i < 9; ++i) {
        NSLog(@"气泡%d",arrBubble[i]);
        
    }
}
-(NSMutableArray *)source{
    if (!_source) {
        _source = [NSMutableArray array];        
    }
    return _source;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
