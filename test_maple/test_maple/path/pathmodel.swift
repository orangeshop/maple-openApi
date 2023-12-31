//
//  pathmodel.swift
//  test_maple
//
//  Created by 최영호 on 12/23/23.
//

import Foundation

class PathModel : ObservableObject{
    @Published var paths : [pathtype]
    
    init(paths: [pathtype] = []) {
        self.paths = paths
    }
}
