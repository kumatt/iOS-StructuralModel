//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark- init
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

#pragma mark-subView
- (void)subView_add
{
    
}

- (void)subView_layout
{
    
}


@end
