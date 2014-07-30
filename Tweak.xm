#import <UIKit/UIKit.h>
#import <SpringBoard/SBControlCenterController.h>

static NSTimeInterval const kHBCUAnimationDuration = 0.2;

UIView *containerView;
UIView *dimmingView;

%hook SBCCBrightnessSectionController

- (void)_sliderDidBeginTracking:(UISlider *)slider {
	%orig;

	UIViewController *viewController = MSHookIvar<UIViewController *>([%c(SBControlCenterController) sharedInstance], "_viewController");

	containerView = MSHookIvar<UIView *>(viewController, "_containerView");
	dimmingView = MSHookIvar<UIView *>(containerView, "_darkeningView");

	[UIView animateWithDuration:kHBCUAnimationDuration animations:^{
		dimmingView.alpha = 0;
		containerView.alpha = 0.7f;
	}];
}

- (void)_sliderDidEndTracking:(UISlider *)slider {
	%orig;

	[UIView animateWithDuration:kHBCUAnimationDuration animations:^{
		dimmingView.alpha = 1;
		containerView.alpha = 1;
	}];
}

%end
