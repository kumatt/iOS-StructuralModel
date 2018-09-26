//___FILEHEADER___

import UIKit

class ___FILEBASENAME___: UIViewController {

    let index_Model:___VARIABLE_productName___ModelIndex = ___VARIABLE_productName___ModelIndex.init()
    
    let index_view:___VARIABLE_productName___ViewIndex = ___VARIABLE_productName___ViewIndex.init()

    let index_viewModel:___VARIABLE_productName___ViewModelIndex = ___VARIABLE_productName___ViewModelIndex.init()

    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setindex_Model()
        self.setIndex_view()
        self.setIndex_viewModel()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - subView configure
    func setindex_Model() {
        
    }
    
    func setIndex_view() {
        
        self.index_view.setContainer(self.view)

    }
    
    func setIndex_viewModel() {
        
    }

}
