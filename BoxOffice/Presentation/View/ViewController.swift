//
//  ViewController.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties

    var viewModel: ViewModel?
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }


}

