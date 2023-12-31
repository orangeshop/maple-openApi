//
//  equipment_modal_view.swift
//  test_maple
//
//  Created by 최영호 on 12/26/23.
//

import SwiftUI
import OSLog
struct equipment_modal_view: View {
    @EnvironmentObject var equipmentviewmodel : equipmentViewModel
    @EnvironmentObject var requestapi : requestApi
    @EnvironmentObject var equipmentmodalviewmodal : equipment_modal_viewmodel
    
    
    var body: some View {
        //TODO: 전부 다 예외처리 들어가야함
        //MARK: - 옵션 순서
        /**
            1. str
            2. dex
            3. int
            4. luk
            5. maxHp
            6. maxMp
            7. 공격력
            8. 마력
            9. 방어력
            10. 이동속도
            11. 점프력
            12. 올스텟
         */
        
        VStack{
            let starforce = requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].starforce ?? ""

            let fill_star = "star.fill"
            let empty_star = "star"
            

            if(starforce == "" || starforce == "0"){
                
                Text("")
                    .hidden()
            }else{
                
                VStack{

                    HStack(spacing: 3){
                        //TODO: 스타포스 별 배치
                        /**
                                1. 첫줄에
                         */
                        ForEach(equipmentmodalviewmodal.starforce_arr[0].indices, id : \.self){idx in
                            
                            if(equipmentmodalviewmodal.starforce_arr[0][idx] == 0){
                                Image(systemName: empty_star)
                            }
                            else{
                                Image(systemName: fill_star)
                                    .foregroundStyle(.yellow)
                            }
                        }
                        
                        Spacer()
                        
                        ForEach(equipmentmodalviewmodal.starforce_arr[1].indices, id : \.self){idx in
                            
                            if(equipmentmodalviewmodal.starforce_arr[1][idx] == 0){
                                Image(systemName: empty_star)
                            }
                            else{
                                Image(systemName: fill_star)
                                    .foregroundStyle(.yellow)
                            }
                        }
                        
                        Spacer()
                        
                        ForEach(equipmentmodalviewmodal.starforce_arr[2].indices, id : \.self){idx in
                            
                            
                            if(equipmentmodalviewmodal.starforce_arr[2][idx] == 0){
                                Image(systemName: empty_star)
                            }
                            else{
                                Image(systemName: fill_star)
                                    .foregroundStyle(.yellow)
                            }
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    HStack(spacing : 3){
                        Spacer()
                        ForEach(equipmentmodalviewmodal.starforce_arr[3].indices, id : \.self){idx in
                            
                            
                            if(equipmentmodalviewmodal.starforce_arr[3][idx] == 0){
                                Image(systemName: empty_star)
                            }
                            else{
                                Image(systemName: fill_star)
                                    .foregroundStyle(.yellow)
                            }
                        }
                        
                        Spacer()
                        
                        ForEach(equipmentmodalviewmodal.starforce_arr[4].indices, id : \.self){idx in
                        
                            
                            if(equipmentmodalviewmodal.starforce_arr[4][idx] == 0){
                                Image(systemName: empty_star)
                            }
                            else{
                                Image(systemName: fill_star)
                                    .foregroundStyle(.yellow)
                            }
                        }
                        Spacer()
                    }
                }
                
            }
        }
        .onAppear{
            let starforce = requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].starforce ?? ""
            equipmentmodalviewmodal.fill_starforce(starforce: Int(starforce) ?? 0)
        }
        .padding()
        
        HStack{
            //TODO: 아이콘, 이름
            Spacer()
            Rectangle()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 5))
                .overlay(
                    AsyncImage(url : URL(string: "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemIcon ?? "")"), scale: 0.5)
                )
            Spacer()
            Text("\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemName ?? "")")
                .font(.system(size: 25, weight: .bold))
            Spacer()
        }
        
        
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 40, height: 1)
        
        
        
        VStack{
            
            
            Text("장비분류 : \(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].equipmentSlot ?? "")")
                .font(.system(size: 25, weight: .bold))
            
            //NOTE: STR
            HStack(spacing: 1){
                Text("STR : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.str) ?? "")")
                
                Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.str) ?? "")")
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.str) ?? "")" != "0"){
                    Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.str) ?? "")")
                }
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.str) ?? "")" != "0"){
                    //보라색
                    Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.str) ?? "")")
                }
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.str) ?? "")" != "0"){
                    Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.str) ?? "")")
                }
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.str) ?? "")" != "0"){
                    // 노란색
                    Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.str) ?? "")")
                }
                
                Text(")")
                
                
            }
            
            //NOTE: DEX
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.dex) ?? "")" != "0"){
                    
                    Text("DEX : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.dex) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.dex) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.dex) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.dex) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.dex) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.dex) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.dex) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.dex) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.dex) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.dex) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: INT
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.int) ?? "")" != "0"){
                    
                    Text("INT : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.int) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.int) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.int) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.int) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.int) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.int) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.int) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.int) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.int) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.int) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: LUK
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.luk) ?? "")" != "0"){
                    
                    Text("LUK : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.luk) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.luk) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.luk) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.luk) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.luk) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.luk) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.luk) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.luk) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.luk) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.luk) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 최대 HP
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.maxHP) ?? "")" != "0"){
                    
                    Text("최대 HP : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.maxHP) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.maxHP) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.maxHP) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.maxHP) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.maxHP) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.maxHP) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.maxHP) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.maxHP) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.maxHP) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.maxHP) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 최대 MP
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.maxMp) ?? "")" != "0"){
                    
                    Text("최대 MP : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.maxMp) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.maxMp) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.maxMp) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.maxMp) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.maxMp) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.maxMp) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.maxMp) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.maxMp) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.maxMp) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.maxMp) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 공격력
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.attackPower) ?? "")" != "0"){
                    
                    Text("공격력 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.attackPower) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.attackPower) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.attackPower) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.attackPower) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.attackPower) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.attackPower) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.attackPower) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.attackPower) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.attackPower) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.attackPower) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 마력
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.magicPower) ?? "")" != "0"){
                    
                    Text("마력 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.magicPower) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.magicPower) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.magicPower) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.magicPower) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.magicPower) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.magicPower) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.magicPower) ?? "")" != "0"){
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.magicPower) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.magicPower) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.magicPower) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 방어력
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.armor) ?? "")" != "0"){
                    
                    Text("방어력 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.armor) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.armor) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.armor) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.armor) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.armor) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.armor) ?? "")")
                    }
                    
                    
//                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.magicPower) ?? "")" != "0"){
//                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemExceptionalOption?.magicPower) ?? "")")
//                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.armor) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.armor) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 스피드
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.speed) ?? "")" != "0"){
                    
                    Text("스피드 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.speed) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.speed) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.speed) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.speed) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.speed) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.speed) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.speed) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.speed) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 점프력
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.jump) ?? "")" != "0"){
                    
                    Text("점프력 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.jump) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.jump) ?? "")")
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.jump) ?? "")" != "0"){
                        //보라색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemEtcOption?.jump) ?? "")")
                    }
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.jump) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.jump) ?? "")")
                    }
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.jump) ?? "")" != "0"){
                        // 노란색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemStarforceOption?.jump) ?? "")")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 보스 데미지
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.bossDamage) ?? "")" != "0"){
                    
                    Text("보스 데미지 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.bossDamage) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.bossDamage) ?? "")")
                    
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.bossDamage) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.bossDamage) ?? "")")
                    }
                    
                    
                    
                    Text(")")
                }
                
                
            }
            
            //NOTE: 몬스터 방어력 무시
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.ignoreMonsterArmor) ?? "")" != "0"){
                    
                    Text("몬스터 방어력 무시 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.ignoreMonsterArmor) ?? "")")
                    
//                    Text("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.ignoreMonsterArmor) ?? "")")
                    
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.ignoreMonsterArmor) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.ignoreMonsterArmor) ?? "")")
                    }
                    
                    Text("%")
                }
                
                
            }
            
            //NOTE: 올스텟
            HStack(spacing: 1){
                
                if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.allStat) ?? "")" != "0"){
                    
                    Text("올스텟 : \((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemTotalOption?.allStat) ?? "")")
                    
                    Text("(\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemBaseOption?.allStat) ?? "")")
                    
                    
                    
                    if("\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.allStat) ?? "")" != "0"){
                        // 녹색
                        Text(" +\((requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].itemAddOption?.allStat) ?? "")%")
                    }
                    
                    Text(")")
                }
                
                
            }
            
            
        }
        
        
        
        
        VStack(alignment : .center){
            let potentialOption1 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].potentialOption1 ?? "")"
            
            let potentialOption2 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].potentialOption2 ?? "")"
            
            let potentialOption3 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].potentialOption3 ?? "")"
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                
            
            if(potentialOption1 != "" && potentialOption2 != "" && potentialOption3 != ""){
                VStack(alignment: .leading){
                    HStack{
                        
                        Text("잠재 옵션")
                            .foregroundStyle(equipmentmodalviewmodal.potential)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    
                    Text(potentialOption1)
                    
                    Text(potentialOption2)
                    
                    Text(potentialOption3)
                }
                .padding(.horizontal, 15)
                
            }
        }
        .onAppear {
            let grade = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].potentialOptionGrade ?? "")"
            equipmentmodalviewmodal.potential(input_potential: grade)
        }
        .padding()
        
        
        
        VStack(alignment : .center){
            
            let additionalPotentialOption1 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].additionalPotentialOption1 ?? "")"
            
            
            let additionalPotentialOption2 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].additionalPotentialOption2 ?? "")"
            
            let additionalPotentialOption3 = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].additionalPotentialOption3 ?? "")"
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 1)
            
            if(additionalPotentialOption1 != "" && additionalPotentialOption2 != "" && additionalPotentialOption3 != ""){
                
                
                VStack(alignment : .leading){
                    HStack{
                        
                        Text("에디셔널 잠재능력")
                            .foregroundStyle(equipmentmodalviewmodal.additionalpotential)
                            .font(.system(size: 20, weight: .semibold))
                        
                        
                    }
                    Text(additionalPotentialOption1)
                    
                    Text(additionalPotentialOption2)
                    
                    Text(additionalPotentialOption3)
                }
                .padding(.horizontal, 15)
            }
        }
        .onAppear {
            let grade = "\(requestapi.Character_equiment_data_list[requestapi.Character_equiment_data_list.count - 1].itemEquipment?[equipmentviewmodel.item_modal_checker].additionalPotentialOptionGrade ?? "")"
            equipmentmodalviewmodal.additionalpotential(input_potential: grade)
        }
        .padding()
        
        
        
    }
}

struct equipment_modal_option_cell : View {
    var body: some View {
        HStack{
            
        }
    }
}


#Preview {
    equipment_modal_view()
}
