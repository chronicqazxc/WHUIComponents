//
//  ViewController.swift
//  WHUIComponentsDemo
//
//  Created by Wayne Hsiao on 2019/9/19.
//  Copyright © 2019 Wayne Hsiao. All rights reserved.
//

import UIKit
import WHUIComponents

class ViewControllerViewModel {
    weak var coordinateDelegate: Coordinator?
    
    func buttonTapped() {
        coordinateDelegate?.navigateToNextPage()
    }
    
    deinit {
        print("")
    }
}

class ViewController: UIViewController {
    
    var viewModel: ViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
    }

    @IBAction func showPaginateTableView(_ sender: Any) {
        viewModel?.buttonTapped()
    }
    
}

