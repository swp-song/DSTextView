//
//  DemoViewController1.swift
//  DSTextViewDemo
//
//  Created by Dream on 2020/12/17.
//

import UIKit

import SnapKit
import DSTextView

class DemoViewController1: BaseViewController {

    
    var textView: DSTextView = {
        let textView: DSTextView = DSTextView()
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DemoViewController1 {
    func setUI() -> Void {
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            make.width.equalTo(self.textView.snp.height).multipliedBy(2.0)
        }
        
        textView.ds.layer.borderWidth = 1
        textView.delegate = self
    }
}

extension DemoViewController1: UITextViewDelegate {
    
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//         return false
//    }
    
    func textViewDidChange(_ textView: UITextView) {
//        @
    }
}
