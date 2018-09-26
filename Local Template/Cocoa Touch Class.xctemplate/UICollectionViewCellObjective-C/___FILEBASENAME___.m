//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark-subView init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commit_init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commit_init];
    }
    return self;
}

- (void)commit_init
{
    [self subView_add];
    [self subView_layout];
}

- (void)subView_add
{
    
}

- (void)subView_layout
{
    
}

@end
