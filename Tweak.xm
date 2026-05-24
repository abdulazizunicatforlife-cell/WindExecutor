#import <UIKit/UIKit.h>
#include <string>
#include <vector>

enum WindTabs { TAB_HOME, TAB_EXECUTOR, TAB_SEARCH };
static int currentTab = TAB_HOME;

static UIView *windowBackground = nil;

void BuildWindUI() {
    if (windowBackground != nil) return;

    // Create a sleek white floating container on the screen boundary
    windowBackground = [[UIView alloc] initWithFrame:CGRectMake(40, 80, 480, 260)];
    windowBackground.backgroundColor = [UIColor colorWithWhite:0.96 alpha:0.90]; 
    windowBackground.layer.cornerRadius = 12.0f; // Rounding edges
    windowBackground.layer.borderWidth = 1.0f;
    windowBackground.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;

    // Creator Tag Subtext Label
    UILabel *creatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 200, 30)];
    creatorLabel.text = @"creator: Jamal567790";
    creatorLabel.font = [UIFont italicSystemFontOfSize:13];
    creatorLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
    [windowBackground addSubview:creatorLabel];

    [[UIApplication sharedApplication].keyWindow addSubview:windowBackground];
}

%hook RobloxViewController
- (void)viewDidLoad {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BuildWindUI();
    });
}
%end
