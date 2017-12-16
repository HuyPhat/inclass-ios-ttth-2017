//
//  HomeViewController.m
//  InClassCollectionView
//
//  Created by TNKHANH on 12/16/17.
//  Copyright © 2017 TNKHANH. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define STATUS_HEIGHT 20
#define NAV_HEIGHT 44
#define MARGIN 5

#import "HomeViewController.h"
#import "CustomCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize tblData;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    tblData.dataSource = self;
    tblData.delegate = self;
}

- (void)setUpView {
    section1Val = 4;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [tblData setFrame:CGRectMake(0, STATUS_HEIGHT+NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_HEIGHT-NAV_HEIGHT)];
    [tblData registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    [tblData registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
}

-(IBAction)deleteItem:(id)sender {
    [tblData performBatchUpdates:^{
        section1Val--;
        [tblData deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]];
    } completion:^(BOOL finished) {
        [tblData reloadData];
    }];
}

-(IBAction)addItem:(id)sender {
    [tblData performBatchUpdates:^{
        section1Val++;
        [tblData insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]];
    } completion:^(BOOL finished) {
        [tblData reloadData];
    }];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 40);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HeaderCollectionReusableView *header = [tblData dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    return header;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return MARGIN;
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return MARGIN;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    int columns = 2;
//    return CGSizeMake(40, 40);
    return CGSizeMake((SCREEN_WIDTH - (columns + 1) * MARGIN) / columns, (SCREEN_WIDTH - (columns + 1) * MARGIN / columns));
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(MARGIN, MARGIN, MARGIN, MARGIN);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0) {
        return section1Val;
    }
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [tblData dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
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
