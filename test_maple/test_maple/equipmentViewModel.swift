//
//  equipmentViewModel.swift
//  test_maple
//
//  Created by 최영호 on 12/24/23.
//

import Foundation

class equipmentViewModel : ObservableObject{
    @Published var equipmentlist : [character_equiment_data]
    @Published var item_modal_checker : Int = -1
    
    init(equipmentlist: [character_equiment_data] = []
    ) {
        self.equipmentlist = equipmentlist
    }
}
