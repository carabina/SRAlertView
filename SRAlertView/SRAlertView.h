//
//  SRAlertView.h
//  SRAlertViewDemo
//
//  Created by 郭伟林 on 16/7/8.
//  Copyright © 2016年 SR. All rights reserved.
//

/**
 *  If you have any question, please issue or contact me.
 *  QQ: 396658379
 *  Email: guowilling@qq.com
 *
 *  If you like it, please star it, thanks a lot.
 *  Github: https://github.com/guowilling/SRAlertView
 *
 *  Have Fun.
 */

#import <UIKit/UIKit.h>

@class SRAlertView;

typedef NS_ENUM(NSInteger, AlertViewActionType) {
    AlertViewActionTypeLT,
    AlertViewActionTypeRT,
};

typedef NS_ENUM(NSInteger, AlertViewAnimationStyle) {
    AlertViewAnimationNone,
    AlertViewAnimationZoom,
    AlertViewAnimationTopToCenterSpring,
    AlertViewAnimationDownToCenterSpring,
    AlertViewAnimationLeftToCenterSpring,
    AlertViewAnimationRightToCenterSpring,
};

@protocol SRAlertViewDelegate <NSObject>

@required
- (void)alertViewDidSelectAction:(AlertViewActionType)actionType;

@end

typedef void(^AlertViewDidSelectAction)(AlertViewActionType actionType);

@interface SRAlertView : UIView

/**
 The Animation style to show alert.
 */
@property (nonatomic, assign) AlertViewAnimationStyle animationStyle;

/**
 Whether blur the current background view, default is YES.
 */
@property (nonatomic, assign) BOOL blurCurrentBackgroundView;

/**
 Button's title color when highlighted.
 */
@property (nonatomic, strong) UIColor *buttonWhenHighlightedTitleColor;

/**
 Button's background color when highlighted.
 */
@property (nonatomic, strong) UIColor *buttonWhenHighlightedBackgroundColor;

#pragma mark - BLOCK

/**
 Quickly show a alert view with block.
 */
+ (void)sr_showAlertViewWithTitle:(NSString *)title
                          message:(NSString *)message
                     leftBtnTitle:(NSString *)leftBtnTitle
                    rightBtnTitle:(NSString *)rightBtnTitle
                   animationStyle:(AlertViewAnimationStyle)animationStyle
                     selectAction:(AlertViewDidSelectAction)selectAction;

/**
 Init a Alert view with block.
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 leftBtnTitle:(NSString *)leftBtnTitle
                rightBtnTitle:(NSString *)rightBtnTitle
               animationStyle:(AlertViewAnimationStyle)animationStyle
                 selectAction:(AlertViewDidSelectAction)selectAction;

#pragma mark - DELEGATE

/**
 Quickly show a alert view with delegate.
 */
+ (void)sr_showAlertViewWithTitle:(NSString *)title
                          message:(NSString *)message
                     leftBtnTitle:(NSString *)leftBtnTitle
                    rightBtnTitle:(NSString *)rightBtnTitle
                   animationStyle:(AlertViewAnimationStyle)animationStyle
                         delegate:(id<SRAlertViewDelegate>)delegate;

/**
 Init a Alert view with delegate.
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 leftBtnTitle:(NSString *)leftBtnTitle
                rightBtnTitle:(NSString *)rightBtnTitle
               animationStyle:(AlertViewAnimationStyle)animationStyle
                     delegate:(id<SRAlertViewDelegate>)delegate;

- (void)show;
    
@end
