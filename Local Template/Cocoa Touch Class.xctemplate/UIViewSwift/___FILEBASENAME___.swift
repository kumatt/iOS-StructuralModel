//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {

//MARK:init function
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commit_init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commit_init()
    }
    
    func commit_init() {
        self.subView_add()
        self.subView_layout()
    }
    
//MARK:subview function
    func subView_add() {
        
    }
    
    func subView_layout() {
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
