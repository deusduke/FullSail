//
//  OCViewController.m
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"
#import "OCAddEventViewController.h"

@interface OCViewController ()

-(void)handleSwipe:(UISwipeGestureRecognizer *)swipe;

@end

@implementation OCViewController

@synthesize saveButton, swipeLabel, eventTextField, swipeRecognizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // setup swipe event
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipeRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeLabel addGestureRecognizer:swipeRecognizer];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe
{
    // grab a VC from the storyboard
    OCAddEventViewController *aevc = [[self storyboard] instantiateViewControllerWithIdentifier:@"OCAddEvent"];
    
    // setup custom transition
    [aevc setTransitioningDelegate:self];
    [aevc setModalPresentationStyle:UIModalPresentationCustom];
    
    // set the animation direction
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[aevc view] cache:YES];
    
    // show the view
    [self presentViewController:aevc animated:NO completion:nil];
}

// setup our fancy transitions
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    //1.Settings for the fromVC ............................
    CGAffineTransform rotation;
    rotation = CGAffineTransformMakeRotation(M_PI);
    fromVC.view.frame = initialFrame;
    fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.0);
    fromVC.view.layer.position = CGPointMake(160.0, 0);
    
    //2.Insert the toVC view...........................
    [container insertSubview:toVC.view belowSubview:fromVC.view];
    CGPoint final_toVC_Center = toVC.view.center;
    
    toVC.view.center = CGPointMake(-initialFrame.size.width, initialFrame.size.height);
    toVC.view.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:.5
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseIn
     
                     animations:^{
                         
                         //Setup the final parameters of the 2 views
                         //the animation interpolates from the current parameters
                         //to the next values.
                         fromVC.view.transform = rotation;
                         toVC.view.center = final_toVC_Center;
                         toVC.view.transform = CGAffineTransformMakeRotation(0);
                     } completion:^(BOOL finished) {
                         
                         //When the animation is completed call completeTransition
                         [transitionContext completeTransition:YES];
                         
                     }];
    
    [transitionContext completeTransition:YES];
}

// fancy transitions duration
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

@end
