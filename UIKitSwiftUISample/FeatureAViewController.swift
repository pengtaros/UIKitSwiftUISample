//
//  FeatureAViewController.swift
//  UIKitSwiftUISample
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import UIKit
import SwiftUI
import FeatureA
import Combine

final class FeatureAViewController: UIHostingController<FeatureAContainer> {
    
    // MARK: - Private Properties
    
    private var cancelable: AnyCancellable?
    
    // MARK: - Initializer
    
    init() {
        let viewModel = FeatureAContainer.ViewModel(name: "")
        super.init(rootView: .init(viewModel))
        observeTransition(viewModel.bind())
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func observeTransition(_ transitionSubject: FeatureAContainer.TransitionSubject) {
        cancelable = transitionSubject.sink { [weak self] transition in
            switch transition {
            case let .next(name):
                self?.navigationController?.pushViewController(FeatureBViewController(name: name), animated: true)
            case let .error(error):
                let alert = UIAlertController(title: "Error", message: error.errorDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }

}
