//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark- init
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
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

#pragma mark- subView
- (void)subView_add
{
    
}

- (void)subView_layout
{
    
}

@end
