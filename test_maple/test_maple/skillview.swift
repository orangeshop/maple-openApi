//
//  skillview.swift
//  test_maple
//
//  Created by 최영호 on 12/24/23.
//

import SwiftUI

struct skillview: View {
    @EnvironmentObject var skillviewmodel : skillviewmodel
    @EnvironmentObject var reqeustApi : requestApi
    
    var body: some View {
        
        VStack{
            HStack{
                Text("스킬")
                    .font(.system(size: 25, weight: .bold))
                    
            }
            
            
            ScrollView(.vertical){
                VStack{
                    Text("\((reqeustApi.Character_six_skill_data_list[reqeustApi.Character_six_skill_data_list.count - 1].characterSkillGrade) ?? "")")
                        .font(.system(size: 25, weight: .bold))
                    
                    
                }
                
                VStack{
                    
                }
            }
        }
    }
}

#Preview {
    skillview()
}
