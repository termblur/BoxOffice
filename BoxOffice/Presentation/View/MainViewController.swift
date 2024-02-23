//
//  MainViewController.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties

    var viewModel: MainViewModel?
    
    
    let blockView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: MainViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }

    // MARK: - Methods
    
    private func addSubviews() {
        
    }
    
    private func layout() {
        
    }
    
    private func bind() {
        
    }
}

