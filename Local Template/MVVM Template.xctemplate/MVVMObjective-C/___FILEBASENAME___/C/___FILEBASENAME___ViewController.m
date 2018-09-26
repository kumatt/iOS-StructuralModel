//___FILEHEADER___

#import "___FILEBASENAMEASIDENTIFIER___.h"
#import "___VARIABLE_productName___ModelIndex.h"
#import "___VARIABLE_productName___ViewIndex.h"
#import "___VARIABLE_productName___ViewModelIndex.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonnull,nonatomic,strong) ___VARIABLE_productName___ModelIndex *index_Model;

@property (nonnull,nonatomic,strong) ___VARIABLE_productName___ViewIndex *index_view;

@property (nonnull,nonatomic,strong) ___VARIABLE_productName___ViewModelIndex *index_viewModel;


@end

@implementation ___VARIABLE_productName___ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self init_commit];
}

- (void)init_commit
{
    [self setindex_Model];
    [self setIndex_view];
    [self setIndex_viewModel];
}

#pragma mark-init
- (void)setindex_Model
{
    
}

- (void)setIndex_view
{
    self.index_view.container = self.view;
}

- (void)setIndex_viewModel
{
    
}

#pragma mark-lazyload
- (___VARIABLE_productName___ModelIndex *)index_Model
{
    if (_index_Model == nil) {
        _index_Model = [___VARIABLE_productName___ModelIndex new];
    }
    return _index_Model;
}

- (___VARIABLE_productName___ViewIndex *)index_view
{
    if (_index_view == nil) {
        _index_view = [___VARIABLE_productName___ViewIndex new];
    }
    return _index_view;
}

- (___VARIABLE_productName___ViewModelIndex *)index_viewModel
{
    if (_index_viewModel == nil) {
        _index_viewModel = [___VARIABLE_productName___ViewModelIndex new];
    }
    return _index_viewModel;
}


@end
