//
//  ViewController.m
//  SRAlertViewDemo
//
//  Created by 郭伟林 on 16/8/7.
//  Copyright © 2016年 SR. All rights reserved.
//

#import "ViewController.h"
#import "SRAlertView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, SRAlertViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"SRAlertView";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"defaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"AnimationNone";
                break;
            case 1:
                cell.textLabel.text = @"AnimationZoom";
                break;
            case 2:
                cell.textLabel.text = @"AnimationTopToCenter";
                break;
            case 3:
                cell.textLabel.text = @"AnimationDownToCenter";
                break;
            case 4:
                cell.textLabel.text = @"AnimationLeftToCenter";
                break;
            case 5:
                cell.textLabel.text = @"AnimationRightToCenter";
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"SingleButton";
                break;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationNone"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:nil
                                    animationStyle:AlertViewAnimationNone
                                     clickBtnBlock:^(NSInteger btnIndex) {
                                         NSLog(@"%zd", btnIndex);
                                     }];
        }
            break;
        case 1:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationZoom"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationZoom
                                     clickBtnBlock:^(NSInteger btnIndex) {
                                         NSLog(@"%zd", btnIndex);
                                     }];
        }
            break;
        case 2:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationTopToCenterSpring"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationTopToCenterSpring
                                     clickBtnBlock:^(NSInteger btnIndex) {
                                         NSLog(@"%zd", btnIndex);
                                     }];
        }
            break;
        case 3:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationDownToCenterSpring"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationDownToCenterSpring
                                          delegate:self];
        }
            break;
        case 4:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationLeftToCenterSpring"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationLeftToCenterSpring
                                          delegate:self];
        }
            break;
        case 5:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationRightToCenterSpring"
                                      leftBtnTitle:@"Sure"
                                     rightBtnTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationRightToCenterSpring
                                          delegate:self];
        }
            break;
    }
}

- (void)alertView:(SRAlertView *)alertView didClickBtnType:(AlertViewBtnType)btnType {
    
    NSLog(@"%zd", btnType);
}

@end
