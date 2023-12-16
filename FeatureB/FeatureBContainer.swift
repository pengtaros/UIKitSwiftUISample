//
//  FeatureBContainer.swift
//  FeatureB
//
//  Created by Sakaguchi Yutaro on 2023/12/16.
//

import SwiftUI

public struct FeatureBContainer: View {
    
    // MARK: - Private Properties
    
    private let name: String
    
    // MARK: - Initializer
    
    public init(name: String) {
        self.name = name
    }
    
    // MARK: - View
    
    public var body: some View {
        Text("Hello, \(name)!")
    }
}

#Preview {
    FeatureBContainer(name: "John Doe")
}
