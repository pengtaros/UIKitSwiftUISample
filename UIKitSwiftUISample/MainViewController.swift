//
//  MainViewController.swift
//  UIKitSwiftUISample
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import UIKit

final class MainViewController: UINavigationController {
    
    // MARK: - Initializer
    
    init() {
        super.init(rootViewController: FeatureAViewController())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
