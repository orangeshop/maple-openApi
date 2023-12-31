//
//  homeview.swift
//  test_maple
//
//  Created by 최영호 on 12/23/23.
//

import SwiftUI

struct Equipment_View: View {
    
    @EnvironmentObject var requestApi : requestApi
    @EnvironmentObject var equipmentviewmodel : equipmentViewModel
    @EnvironmentObject var equipmentmodalviewmodel : equipment_modal_viewmodel
    
    @State var modal_checker : Bool = false
    
    @State var item_idx_check : [[Int]] = [[-1,-1,-1],
                                            [-1,-1,-1,-1],
                                            [-1,-1,-1,-1,-1],
                                            [-1,-1,-1,-1,-1],
                                            [-1,-1,-1,-1,-1],
                                            [-1,-1,-1]]
    
    @State var item_idx_color : [[Int]] = [[-2,-1,-1],
                                           [-1,-1,-1,-1],
                                           [-1,-1,-1,-1,-1],
                                           [-1,-1,-1,-1,-1],
                                           [-1,-1,-1,-1,-1],
                                           [-1,-1,-1]]
    
    var body: some View {
        VStack{
            HStack(){
                Text("장비")
                    .font(.system(size: 28, weight: .bold))
            }
            if(!requestApi.Character_equiment_data_list.isEmpty){
                let _ = print("Log : eq_view_")
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .center){
                        
                        //TODO: 1단(반지9, 모자0, 엠블럼21)
                        HStack(alignment: .center){
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[0][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[0][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[0][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[0][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    //TODO: requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[0].itemEquipmentPart 배열을 돌려 각 위치에 맞는 아이템을 할당하는 코드를 작성해줘야함 현재는 배열에 값을 할당하는 방식이라서
                                    
                                    
                                    VStack{
                                        if(item_idx_check[0][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][0]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "반지1"){
                                                item_idx_check[0][0] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][0]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[0][0] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][0]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[0][0] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][0]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[0][0] = 2
                                        }
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[0][0]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            
                            Rectangle()
                                .foregroundStyle(.clear)
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[0][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[0][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[0][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[0][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    
                                    VStack{
                                        if(item_idx_check[0][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][1]].itemIcon! ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "모자"){
                                                item_idx_check[0][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[0][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[0][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[0][1] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[0][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .foregroundStyle(.clear)
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[0][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[0][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[0][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[0][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[0][2] != -1){
                                            AsyncImage(url: URL(string: "\( requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][2]].itemIcon! ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "엠블렘"){
                                                item_idx_check[0][2] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[0][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[0][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[0][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[0][2] = 2
                                        }
                                        
                                    }
                                    .onTapGesture {
                                        modal_checker.toggle()
                                        equipmentviewmodel.item_modal_checker = item_idx_check[0][2]
                                    }
                                    .sheet(isPresented: $modal_checker){
                                        equipment_modal_view()
                                            .presentationDetents([.large, .medium, .fraction(0.75)])
                                    }
                                    
                                    
                                }
                        }
                        
                        //TODO: 2단(반지8, 팬던트11, 눈장12, 뱃지18)
                        HStack(alignment: .center){
                            // 반지 8
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[1][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[1][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[1][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[1][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[1][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][0]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "반지2"){
                                                item_idx_check[1][0] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][0]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[1][0] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][0]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[1][0] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][0]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[1][0] = 2
                                        }
                                        
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[1][0]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            // 팬던트 11
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[1][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[1][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[1][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[1][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[1][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][1]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "펜던트"){
                                                item_idx_check[1][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[1][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[1][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[1][1] = 2
                                        }
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[1][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            // 얼장 12
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[1][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[1][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[1][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[1][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[1][2] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][2]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "눈장식"){
                                                item_idx_check[1][2] = i
                                            }
                                        }
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[1][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[1][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[1][2] = 2
                                        }
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[1][2]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .foregroundStyle(.clear)
                            
                            // 뱃지 18
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[1][3] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[1][3] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[1][3] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[1][3] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[1][3] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][3]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "뱃지"){
                                                item_idx_check[1][3] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][3]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[1][3] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][3]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[1][3] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[1][3]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[1][3] = 2
                                        }
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[1][3]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                        }
                        
                        //TODO: 3단(반지7, 팬던트10, 얼장13, 뱃지14, 훈장 18)
                        HStack(alignment: .center){
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[2][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[2][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[2][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[2][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[2][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][0]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "반지3"){
                                                item_idx_check[2][0] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][0]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[2][0] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][0]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[2][0] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][0]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[2][0] = 2
                                        }
                                        
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[2][0]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[2][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[2][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[2][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[2][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[2][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][1]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "펜던트2"){
                                                item_idx_check[2][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[2][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[2][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[2][1] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[2][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[2][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[2][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[2][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[2][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[2][2] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][2]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "얼굴장식"){
                                                item_idx_check[2][2] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[2][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[2][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[2][2] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[2][2]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[2][3] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[2][3] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[2][3] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[2][3] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[2][3] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][3]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "귀고리"){
                                                item_idx_check[2][3] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][3]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[2][3] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][3]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[2][3] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][3]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[2][3] = 2
                                        }
                                        
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[2][3]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[2][4] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[2][4] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[2][4] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[2][4] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[2][4] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][4]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "훈장"){
                                                item_idx_check[2][4] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][4]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[2][4] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][4]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[2][4] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[2][4]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[2][4] = 2
                                        }
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[2][4]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                        }
                        
                        //TODO: 4단(반지6, 무기19, 상의1, 어깨15, 도서20)
                        HStack(alignment: .center){
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[3][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[3][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[3][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[3][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[3][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][0]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "반지4"){
                                                item_idx_check[3][0] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][0]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[3][0] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][0]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[3][0] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][0]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[3][0] = 2
                                        }
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[3][0]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[3][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[3][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[3][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[3][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[3][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][1]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        
//                                        let _ = print(" \(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[0].equipmentSlot)")
                                        
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "무기"){
                                                item_idx_check[3][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[3][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[3][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[3][1] = 2
                                        }
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[3][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[3][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[3][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[3][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[3][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[3][2] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][2]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "상의"){
                                                item_idx_check[3][2] = i
                                            }
                                        }
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[3][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[3][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[3][2] = 2
                                        }
                                        
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[3][2]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[3][3] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[3][3] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[3][3] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[3][3] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[3][3] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][3]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "어깨장식"){
                                                item_idx_check[3][3] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][3]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[3][3] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][3]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[3][3] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][3]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[3][3] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[3][3]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[3][4] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[3][4] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[3][4] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[3][4] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    VStack{
                                        if(item_idx_check[3][4] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][4]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "포켓 아이템"){
                                                item_idx_check[3][4] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][4]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[3][4] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][4]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[3][4] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[3][4]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[3][4] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[3][4]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                        }
                        
                        //TODO: 5단(성배22, 벨트17, 하의2, 장갑4, 망토3)
                        HStack(alignment: .center){
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[4][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[4][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[4][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[4][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[4][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][0]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "포켓 아이템"){
                                                item_idx_check[4][0] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][0]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[4][0] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][0]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[4][0] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][0]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[4][0] = 2
                                        }
                                        
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[4][0]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[4][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[4][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[4][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[4][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[4][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][1]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "벨트"){
                                                item_idx_check[4][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[4][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[4][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[4][1] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[4][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[4][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[4][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[4][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[4][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[4][2] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][2]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "하의"){
                                                item_idx_check[4][2] = i
                                            }
                                        }
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[4][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[4][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[4][2] = 2
                                        }
                                    }
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[4][2]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[4][3] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[4][3] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[4][3] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[4][3] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[4][3] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][3]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "장갑"){
                                                item_idx_check[4][3] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][3]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[4][3] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][3]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[4][3] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][3]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[4][3] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[4][3]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[4][4] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[4][4] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[4][4] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[4][4] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[4][4] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][4]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "망토"){
                                                item_idx_check[4][4] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][4]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[4][4] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][4]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[4][4] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[4][4]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[4][4] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[4][4]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                        }
                        //TODO: 6단(칭호(title), 신발5, 심장23)
                        HStack(alignment: .center){
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[5][0] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[5][0] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[5][0] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[5][0] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[5][0] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].title?.titleIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        
                                        if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].title?.titleName != ""){
                                            item_idx_check[5][0] = 1
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                            Rectangle()
                                .foregroundStyle(.clear)
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[5][1] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[5][1] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[5][1] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[5][1] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[5][1] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][1]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "신발"){
                                                item_idx_check[5][1] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][1]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[5][1] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][1]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[5][1] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][1]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[5][1] = 2
                                        }
                                        
                                    }
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[5][1]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                            Rectangle()
                                .foregroundStyle(.clear)
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 5))
                                .shadow(color: {
                                    if(item_idx_color[5][2] == -1){
                                        return .black
                                    }
                                    else if(item_idx_color[5][2] == 0){
                                        return .green
                                    }
                                    else if(item_idx_color[5][2] == 1){
                                        return .yellow
                                    }
                                    else if(item_idx_color[5][2] == 2){
                                        return .purple
                                    }
                                    else{
                                        return .black
                                    }
                                }(), radius: 5)
                                .foregroundStyle(Color(red: 155/255, green: 155/255, blue: 155/255))
                                .frame(height: 58)
                                .overlay(alignment: .center) {
                                    
                                    
                                    VStack{
                                        if(item_idx_check[5][2] != -1){
                                            AsyncImage(url: URL(string: "\(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][2]].itemIcon ?? "")"), scale: 0.8)
                                        }
                                    }
                                    .onAppear{
                                        for i in 0 ..< requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment!.count{
                                            //
                                            if(requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[i].equipmentSlot == "기계 심장"){
                                                item_idx_check[5][2] = i
                                            }
                                        }
                                        
                                        if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][2]].potentialOptionGrade) ?? nil == "레전드리"){
                                            item_idx_color[5][2] = 0
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][2]].potentialOptionGrade) ?? nil == "유니크"){
                                            item_idx_color[5][2] = 1
                                        }
                                        else if((requestApi.Character_equiment_data_list[requestApi.Character_equiment_data_list.count - 1].itemEquipment?[item_idx_check[5][2]].potentialOptionGrade) ?? nil == "에픽"){
                                            item_idx_color[5][2] = 2
                                        }
                                    }
                                    
                                    
                                }
                                .onTapGesture {
                                    modal_checker.toggle()
                                    equipmentviewmodel.item_modal_checker = item_idx_check[5][2]
                                }
                                .sheet(isPresented: $modal_checker){
                                    equipment_modal_view()
                                        .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                        }
                        
                        
                    }
                    .padding()
                }.scrollDisabled(false)
                
            }
        }
        
    }
}

#Preview {
    Equipment_View()
}
