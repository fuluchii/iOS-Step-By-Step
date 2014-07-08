//
//  StatusBarViewController.h
//  dragDrop
//
//  Created by fuluchii on 14-7-8.
//  Copyright (c) 2014年 fuluchii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarViewController : UIViewController
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
