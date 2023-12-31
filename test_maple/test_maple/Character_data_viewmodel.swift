//
//  Character_data_viewmodel.swift
//  test_maple
//
//  Created by 최영호 on 12/24/23.
//

import Foundation

class character_data_viewmodel: ObservableObject{
    @Published var character_data : [Character_data]
    
    
    init(character_data: [Character_data] = []
        
    ) {
        self.character_data = character_data
        
    }
    
    func input_character_data(character_guild_name : String,
                              date : String,
                              character_class_level : String,
                              character_exp : String,
                              character_exp_rate : String,
                              character_image : String,
                              world_name : String,
                              character_name : String,
                              character_gender : String,
                              character_class : String,
                              character_level : String){
        
        character_data.append(Character_data(character_guild_name: character_guild_name,
                                             date: date,
                                             character_class_level: character_class_level,
                                             character_exp: character_exp,
                                             character_exp_rate: character_exp_rate,
                                             character_image: character_image,
                                             world_name: world_name,
                                             character_name: character_name,
                                             character_gender: character_gender,
                                             character_class: character_class,
                                             character_level: character_level))
        
        print("\(character_data.count)")
        
        
    }

}
