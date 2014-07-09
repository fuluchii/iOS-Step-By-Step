//
//  StatusBarViewController.m
//  dragDropGesture
//
//  Created by fuluchii on 14-7-9.
//  Copyright (c) 2014年 fuluchii. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dragImage;
@property (strong,nonatomic) UIPanGestureRecognizer *dragRecognizer;
@property (nonatomic)     CGPoint position;
@end

@implementation StatusBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    [_dragImage addGestureRecognizer:_dragRecognizer];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleDrag:(UIPanGestureRecognizer *)recogonizer{
    if(recogonizer.state == UIGestureRecognizerStateBegan){
        _position = _dragImage.center;
        NSLog(@"start %f %f",_position.x,_position.y);
    }
    else if(recogonizer.state == UIGestureRecognizerStateChanged){
        
        
        NSLog(@"x: %F,y:%f",[recogonizer translationInView:self.view].x,[recogonizer translationInView:self.view].y);
        _dragImage.center = CGPointMake(_position.x+[recogonizer translationInView:self.view].x, _position.y+[recogonizer translationInView:self.view].y);
        NSLog(@"move %f %f",_position.x,_position.y);

    }else if(recogonizer.state == UIGestureRecognizerStateEnded){
        
    }
}

@end
