//
//  OCViewController.m
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"
#import "OCAddEventViewController.h"
#import "OCAppSingleton.h"

@interface OCViewController ()

@property (weak, nonatomic) OCAppSingleton *singletonInstance;
-(void)handleSwipe:(UISwipeGestureRecognizer *)swipe;

@end

@implementation OCViewController

@synthesize singletonInstance, saveButton, swipeLabel, eventTextField, swipeRecognizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    singletonInstance = [OCAppSingleton getInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // set the default text
    [eventTextField setText:[singletonInstance eventText]];
    
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
    
    // show the view
    [self presentViewController:aevc animated:YES completion:nil];
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //Get references to the view hierarchy
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // if we are the from, then we are going to the modal
    if ([fromViewController isKindOfClass:[self class]]) {
        //Add 'to' view to the hierarchy with 0.0 scale
        toViewController.view.transform = CGAffineTransformMakeTranslation(-320, 0.0);
        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
        
        //Scale the 'to' view to to its final position
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else { // dismiss the modal
        //Add 'to' view to the hierarchy
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        //Scale the 'from' view down until it disappears
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.transform = CGAffineTransformMakeTranslation(-320.0, 0.0);
        } completion:^(BOOL finished) {
            [[self eventTextField] setText:[singletonInstance eventText]];
            
            [transitionContext completeTransition:YES];
        }];
    }
}

// how long does this transition last
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

// set ourself as transition delegate for from and to controllers
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

// save the user default
- (void)onSave:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[singletonInstance eventText] forKey:@"EventText"];
}
@end
