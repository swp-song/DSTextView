//
//  DemoViewController4.swift
//  DSTextViewDemo
//
//  Created by Dream on 2020/12/17.
//

import UIKit

class DemoViewController4: BaseViewController {

    
    lazy var customView : CustomView = {
        let customView = CustomView()
        return customView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(customView)
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
