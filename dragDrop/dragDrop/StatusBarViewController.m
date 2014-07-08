//
//  StatusBarViewController.m
//  dragDrop
//
//  Created by fuluchii on 14-7-8.
//  Copyright (c) 2014年 fuluchii. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dragImage;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,assign) CGPoint offset;
@property Boolean isdrag;

@end

@implementation StatusBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isdrag = false;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _label.text = @"begin touch";
    
    //calculate touch point
    UITouch *touch = [touches anyObject];
    NSLog(@"X location: %f",[touch locationInView:self.view].x);
    NSLog(@"Y location: %f",[touch locationInView:self.view].y);
    CGPoint touchPoint = [[touches anyObject] locationInView:(self.view)];
    CGRect imageRect = _dragImage.frame;
    if(CGRectContainsPoint(imageRect, touchPoint)){
        _isdrag = true;
        _offset.x = touchPoint.x-_dragImage.frame.origin.x;
        _offset.y = touchPoint.y -_dragImage.frame.origin.y;
    }else{
        _isdrag = false;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:(self.view)];
    if(_isdrag){
        CGRect position = CGRectMake(touchPoint.x-_offset.x, touchPoint.y-_offset.y, _dragImage.frame.size.width, _dragImage.frame.size.height);
        _dragImage.frame = position;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _offset.x = 0;
    _offset.y = 0;
    _isdrag = false;
}

@end
