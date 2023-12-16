//
//  FeatureBViewController.swift
//  UIKitSwiftUISample
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import UIKit
import SwiftUI
import FeatureB

final class FeatureBViewController: UIHostingController<FeatureBContainer> {
    
    // MARK: - Initializer
    
    init(name: String) {
        super.init(rootView: .init(name: name))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
