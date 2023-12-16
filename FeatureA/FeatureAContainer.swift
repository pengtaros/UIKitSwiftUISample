//
//  FeatureAContainer.swift
//  FeatureA
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import SwiftUI
import Combine

public struct FeatureAContainer: View {
    
    // MARK: - Transition
    
    public enum Transition {
        case next(name: String)
        case error(error: LocalizedError)
    }
    
    public typealias TransitionSubject = PassthroughSubject<Transition, Never>
    
    // MARK: - Error
    
    private enum NameValidationError: LocalizedError {
        case tooShort
        
        var errorDescription: String? {
            switch self {
            case .tooShort: "名前は1文字以上で入力してください"
            }
        }
    }
    
    // MARK: - ViewModel
    
    public final class ViewModel: ObservableObject {
        
        @Published fileprivate var name: String
        
        private var transitionSubject: TransitionSubject?
        
        public init(name: String) {
            self.name = name
        }
        
        public func bind() -> TransitionSubject {
            let transitionSubject = TransitionSubject()
            self.transitionSubject = transitionSubject
            return transitionSubject
        }
        
        fileprivate func didTapNext() {
            guard !name.isEmpty else { transitionSubject?.send(.error(error: NameValidationError.tooShort))
                return
            }
            
            transitionSubject?.send(.next(name: name))
        }
    }
    
    // MARK: - Private Properties
    
    @ObservedObject
    private var viewModel: ViewModel
    
    // MARK: - Initializer
    
    public init(_ viewModel: ViewModel){
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    public var body: some View {
        VStack {
            TextField(text: $viewModel.name) {
                Text("input your name")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            Button(
                action: {
                    viewModel.didTapNext()
                },
                label: {
                    Text("NEXT")
                }
            )
            .buttonStyle(.borderedProminent)
        }
    }

}

#Preview {
    FeatureAContainer(.init(name: "John Doe"))
}
