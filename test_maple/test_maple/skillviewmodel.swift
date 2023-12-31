//
//  skillviewmodel.swift
//  test_maple
//
//  Created by 최영호 on 12/28/23.
//

import Foundation

class skillviewmodel : ObservableObject{
    @Published var skill_five_data : [CharacterSkillFiveData]
    @Published var skill_six_data : [CharacterSkillSixData]
    
    @Published var invalid_V_skill_data : [CharacterVData]
    @Published var invalid_HEXA_skill_data : [CharacterHexaData]
    
    
    init(skill_five_data: [CharacterSkillFiveData] = [],
         skill_six_data: [CharacterSkillSixData] = [],
         invalid_V_skill_data : [CharacterVData] = [],
         invalid_HEXA_skill_data : [CharacterHexaData] = []
    ) {
        self.skill_five_data = skill_five_data
        self.skill_six_data = skill_six_data
        self.invalid_V_skill_data = invalid_V_skill_data
        self.invalid_HEXA_skill_data = invalid_HEXA_skill_data
    }
    
}
