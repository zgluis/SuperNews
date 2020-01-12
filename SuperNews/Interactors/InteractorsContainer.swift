//
//  InteractorsContainer.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import SwiftUI

struct InteractorsContainer: EnvironmentKey {
    
    let mainInteractor: MainInteractor
    let baseUrl: String

    init(mainInteractor: MainInteractor, baseUrl: String) {
        self.mainInteractor = mainInteractor
        self.baseUrl = baseUrl
    }
    
    static var defaultValue: InteractorsContainer {
        return .init(mainInteractor: MainInteractor(newsWorker: NewsWorker()), baseUrl: "")
    }
}

extension EnvironmentValues {
    var interactors: InteractorsContainer {
        get { self[InteractorsContainer.self] }
        set { self[InteractorsContainer.self] = newValue }
    }
}
