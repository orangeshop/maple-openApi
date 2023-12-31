//
//  test_mapleApp.swift
//  test_maple
//
//  Created by 최영호 on 12/23/23.
//

import SwiftUI

@main
struct test_mapleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(requestApi())
                .environmentObject(character_data_viewmodel())
                .environmentObject(equipmentViewModel())
                .environmentObject(equipment_modal_viewmodel())
                .environmentObject(skillviewmodel())
        }
    }
}
