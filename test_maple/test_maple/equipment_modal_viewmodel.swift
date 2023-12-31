//
//  equipment_modal_viewmodel.swift
//  test_maple
//
//  Created by 최영호 on 12/27/23.
//

import Foundation
import SwiftUI

class equipment_modal_viewmodel : ObservableObject{
    
    @Published var starforce_arr : [[Int]]
    @Published var potential : Color
    @Published var additionalpotential : Color
    @Published var option_list : [[String]]
    
    
    init(starforce_arr: [[Int]]  = [[0,0,0,0,0],
                                    [0,0,0,0,0],
                                    [0,0,0,0,0],
                                    [0,0,0,0,0],
                                    [0,0,0,0,0]],
         potential : Color = Color.black,
         additionalpotential : Color = Color.black,
         option_list : [[String]] = []
    ) {
        self.starforce_arr = starforce_arr
        self.potential = potential
        self.additionalpotential = additionalpotential
        self.option_list = option_list
    }
    
    func fill_starforce(starforce : Int){
        
        for i in 0 ..< 5{
            for k in 0 ..< 5{
                if(starforce >= (i * 5) + k){
                    starforce_arr[i][k] = 1
                }
            }
        }
    }
    
    func potential(input_potential : String){
        if(input_potential == "레전드리"){
            potential = Color.green
        }
        else if(input_potential == "유니크"){
            potential = Color.orange
        }
        else if(input_potential == "에픽"){
            potential = Color.purple
        }
        else if(input_potential == "레어"){
            potential = Color.blue
        }
        else{
            
        }
    }
    
    func additionalpotential(input_potential : String){
        if(input_potential == "레전드리"){
            additionalpotential = Color.green
        }
        else if(input_potential == "유니크"){
            additionalpotential = Color.orange
        }
        else if(input_potential == "에픽"){
            additionalpotential = Color.purple
        }
        else if(input_potential == "레어"){
            additionalpotential = Color.blue
        }
    }
    
    
    
}
