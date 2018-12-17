//___FILEHEADER___
//___VARIABLE_productName___生命周期控制及业务中转站

import UIKit

class ___FILEBASENAME___: UIViewController {

    private let index_Model:___VARIABLE_productName___ModelIndex = ___VARIABLE_productName___ModelIndex.init()
    
    private let index_view:___VARIABLE_productName___ViewIndex = ___VARIABLE_productName___ViewIndex.init()

    private let index_viewModel:___VARIABLE_productName___ViewModelIndex = ___VARIABLE_productName___ViewModelIndex.init()

    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setindex_Model()
        setIndex_view()
        setIndex_viewModel()
    }
    
    // MARK: - init
    /// 数据模型初始配置
    private func setindex_Model() {
        
    }
    
    /// 显示层初始配置
    private func setIndex_view() {
        self.index_view.setContainer(self.view)

    }
    
    /// 配置逻辑及业务逻辑初始配置
    private func setIndex_viewModel() {
        
    }
}
