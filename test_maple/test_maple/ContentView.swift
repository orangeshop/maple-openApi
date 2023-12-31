//
//  ContentView.swift
//  test_maple
//
//  Created by 최영호 on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var requst_api : requestApi
    @EnvironmentObject var pathmodel : PathModel
    @EnvironmentObject var character_data_viewmodel : character_data_viewmodel
    
    @State var choose_view : Int = 0
    @State var alert_check : Bool = false
    var body: some View {
        VStack {
            HStack{
                TextField("input name", text: $requst_api.characterName)
                    
                Button(action: {
//                    let _ =  print("return ocid : \(requst_api.return_ocid)")
                    if requst_api.characterName.isEmpty{
                        alert_check = true
                    }
                    else if((requst_api.characterName.filter{$0 == " "}.count) != 0){
                        print("공백 존재")
                    }
                    else{
                        requst_api.ocid_func(name: requst_api.characterName)
                    }
                    
//                    requst_api.reload()
                    
                    



                    

                    
                    
                }, label: {
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 50, height: 50)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay {
                            Image(systemName: "arrow.left.circle")
                                .foregroundStyle(.white)
                        }
                })
                .alert("이름을 입력해주세요!", isPresented: $alert_check, actions: {
                    Text("닫기")
                        .onAppear {
                            alert_check.toggle()
                        }
                })
            }
            
            
            
            VStack{
                //TODO: 캐릭터 이미지, 레벨, 길드, 서버 등등
                
                if(requst_api.Character_data_list.isEmpty){
//                    Text("no data \(character_data_viewmodel.character_data.count).")
//                    Text("no data \(requst_api.Character_data_list.count).")
                }
                else{
                    
                    HStack{
                        Rectangle()
                            .clipShape(.rect(cornerRadius: 5))
                            .foregroundStyle(Color.orange)
                            .overlay(alignment: .center) {
                                AsyncImage(url: URL(string: "\(requst_api.Character_data_list[requst_api.Character_data_list.count-1].character_image)"), scale: 0.6)
//
                            }
                        
                        VStack(alignment: .leading){
                            Spacer()
                            
                            Text("\(requst_api.Character_data_list[requst_api.Character_data_list.count-1].character_name)")
                                .font(.system(size: 20, weight: .bold))
                            
                            
                            Spacer()
                            Text("서버 : \(requst_api.Character_data_list[requst_api.Character_data_list.count-1].world_name)")
                            Spacer()
                            Text("직업 : \(requst_api.Character_data_list[requst_api.Character_data_list.count-1].character_class)")
                            Spacer()
                            Text("레벨 : \(requst_api.Character_data_list[requst_api.Character_data_list.count-1].character_level)")
                            Spacer()
                            Text("길드 : \(requst_api.Character_data_list[requst_api.Character_data_list.count-1].character_guild_name)")
                            Spacer()
                            
                        }
                    }
                    .frame(height: 250)
                    
                }
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 40, height: 1)
            
            ScrollView(.horizontal){
                HStack(alignment: .center){
                    Capsule()
                        .frame(width: 75, height: 25)
                        .foregroundStyle(.yellow)
                        .overlay {
                            Button {
                                choose_view = 0
                            } label: {
                                Text("장비")
                                    .foregroundStyle(.black)
                                    
                            }

                        }
                        
                    Capsule()
                        .frame(width: 75, height: 25)
                        .foregroundStyle(.yellow)
                        .overlay {
                            Button {
                                choose_view = 1
                            } label: {
                                Text("스킬")
                                    .foregroundStyle(.black)
                            }
                        }
                    Capsule()
                        .frame(width: 75, height: 25)
                        .foregroundStyle(.yellow)
                        .overlay {
                            Button {
                                choose_view = 2
                            } label: {
                                Text("스탯")
                                    .foregroundStyle(.black)
                            }
                        }
                    
                    Capsule()
                        .frame(width: 75, height: 25)
                        .foregroundStyle(.yellow)
                        .overlay {
                            Button {
                                choose_view = 3
                            } label: {
                                Text("유니온")
                                    .foregroundStyle(.black)
                            }
                        }
                }
            }
            
            VStack{
                Text("")
                //TODO: 아이템 등
                //TODO: 아이템 클릭시 팝업으로 능력치 보여주기
                
                
                if(choose_view == 0){
                    Equipment_View()
                }
                else if(choose_view == 1){
                    skillview()
                }
                else{
                    
                }
            }
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
