import Foundation


class requestApi : ObservableObject{
    
    
    @Published var characterName : String
    @Published var return_ocid : String
    @Published var Character_data_list = character_data_viewmodel().character_data
    @Published var Character_equiment_data_list =  equipmentViewModel().equipmentlist
    @Published var Character_five_skill_data_list = skillviewmodel().skill_five_data
    @Published var Character_six_skill_data_list = skillviewmodel().skill_six_data
    
    
    var urlString_ocid : String
    var urlString_get_charcter_data : String
    var ocid : String = ""
   
    
    init(characterName: String = "",
         urlString_ocid: String = "https://open.api.nexon.com/maplestory/v1/id?character_name=",
         urlString_get_charcter_data : String = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid=",
         return_ocid : String = ""
         
         
    ) {
        self.characterName = characterName
        self.urlString_ocid = urlString_ocid
        self.urlString_get_charcter_data = urlString_get_charcter_data
        self.return_ocid = return_ocid
        
    }
    
    func reload(){
        self.get_charcter_data(ocid: self.ocid)
        self.get_charcter_equipment_data(ocid: self.ocid)
    }
    
    // Create URL object
    func ocid_func(name : String){
        
        let result_url = "\(urlString_ocid + name)"
        let encoing_url = result_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if let url = URL(string: encoing_url) {
            
            var request = URLRequest(url: url)
            
            // Set the request headers
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            // Create a URLSession task for making the GET request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    // Parse the JSON response
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                            print(json.values)
                            self.ocid = "\(json.values)"
//                            print("\(ocid)")
                            self.ocid.remove(at: self.ocid.startIndex)
                            self.ocid.remove(at: self.ocid.index(self.ocid.startIndex, offsetBy: self.ocid.count-1))
                            
//                            print("ocid : \(ocid)")
                            if((self.ocid.filter{$0 == "{" || $0 == "}"}.count) == 0){
                                DispatchQueue.global(qos: .userInteractive).sync{
                                    self.return_ocid = self.ocid
                                }
                                
                                self.get_charcter_data(ocid: self.ocid)
                                self.get_charcter_equipment_data(ocid: self.ocid)
                                self.get_charcter_skill_data(ocid: self.ocid)
                            }
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            
            // Start the URLSession task
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func get_charcter_data(ocid : String){
        let now_date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let af_date = dateFormater.string(from: now_date)
        let pre_year = af_date.split(separator: "-")[0]
        let pre_month = af_date.split(separator: "-")[1]
        let pre_day = af_date.split(separator: "-")[2]

        let sum_date = "\(pre_year)-" + "\(pre_month)-" + "\((Int(pre_day)!)-2)"

        let result_url = "\(urlString_get_charcter_data + ocid + "&date=" + sum_date)"
        

        
        let encoing_url = result_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if let url = URL(string: encoing_url) {
            
            var request = URLRequest(url: url)
            
            // Set the request headers
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            // Create a URLSession task for making the GET request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    // Parse the JSON response
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

                            
                            let temp_character_guild_name = "\(json["character_guild_name"]!)"
                            let temp_date = "\(json["date"]!)"
                            let temp_character_exp = "\(json["character_exp"]!)"
                            let temp_character_class_level = "\(json["character_class_level"]!)"
                            let temp_character_exp_rate = "\(json["character_exp_rate"]!)"
                            let temp_character_image = "\(json["character_image"]!)"
                            let temp_character_gender = "\(json["character_gender"]!)"
                            let temp_world_name = "\(json["world_name"]!)"
                            let temp_character_class = "\(json["character_class"]!)"
                            let temp_character_level = "\(json["character_level"]!)"
                            let temp_character_name = "\(json["character_name"]!)"
                            

                            
                            self.Character_data_list.append(Character_data(character_guild_name: temp_character_guild_name, date: temp_date, character_class_level: temp_character_exp, character_exp: temp_character_class_level, character_exp_rate: temp_character_exp_rate, character_image: temp_character_image, world_name: temp_world_name, character_name: temp_character_name, character_gender: temp_character_gender, character_class: temp_character_class, character_level: temp_character_level))
                            
                            

                            
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            
            // Start the URLSession task
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func get_charcter_equipment_data(ocid : String){
        let now_date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let af_date = dateFormater.string(from: now_date)
        let pre_year = af_date.split(separator: "-")[0]
        let pre_month = af_date.split(separator: "-")[1]
        let pre_day = af_date.split(separator: "-")[2]

        let sum_date = "\(pre_year)-" + "\(pre_month)-" + "\((Int(pre_day)!)-2)"

        let result_url = "\("https://open.api.nexon.com/maplestory/v1/character/item-equipment?ocid=" + ocid + "&date=" + sum_date)"
        
        let encoing_url = result_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if let url = URL(string: encoing_url) {
            
            var request = URLRequest(url: url)
            
            // Set the request headers
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            // Create a URLSession task for making the GET request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                   
                    let json = try? JSONDecoder().decode(character_equiment_data.self, from: data)
//                    print("item json \(json?.itemEquipment?[0].itemShapeIcon) \(data)")
//                    print(json?.title.titleIcon)
                    self.Character_equiment_data_list.append(json!)
                }
            }
            
            // Start the URLSession task
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func get_charcter_skill_data(ocid : String){
        let now_date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let af_date = dateFormater.string(from: now_date)
        let pre_year = af_date.split(separator: "-")[0]
        let pre_month = af_date.split(separator: "-")[1]
        let pre_day = af_date.split(separator: "-")[2]

        let sum_date = "\(pre_year)-" + "\(pre_month)-" + "\((Int(pre_day)!)-2)"

        let five_skill_url = "\("https://open.api.nexon.com/maplestory/v1/character/skill?ocid=" + ocid + "&date=" + sum_date + "&character_skill_grade=5")"
        let encoing_url = five_skill_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let six_skill_url = "\("https://open.api.nexon.com/maplestory/v1/character/skill?ocid=" + ocid + "&date=" + sum_date + "&&character_skill_grade=6")"
        let encoding_six_url = six_skill_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        
        let invaild_V_skill_url = "\("https://open.api.nexon.com/maplestory/v1/character/vmatrix?ocid=" + ocid + "&date=" + sum_date)"
        let encoding_invaild_V_skill_url = invaild_V_skill_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        
        let invaild_HEXA_skill_url = "\("https://open.api.nexon.com/maplestory/v1/character/hexamatrix?ocid=" + ocid + "&date=" + sum_date)"
        let encoding_invaild_HEXA_skill_url = invaild_HEXA_skill_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        
        
        if let url = URL(string: encoing_url) {
            
            var request = URLRequest(url: url)
            
            // Set the request headers
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            // Create a URLSession task for making the GET request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                   
                    let json = try? JSONDecoder().decode(CharacterSkillFiveData.self, from: data)
                    
                    print(json)
                    
                    self.Character_five_skill_data_list.append(json!)
                    
                    
                }
            }
            
            // Start the URLSession task
            task.resume()
        } else {
            print("Invalid URL")
        }
        
        
        if let six_url = URL(string: encoding_six_url){
            var request = URLRequest(url: six_url)
            
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            let task = URLSession.shared.dataTask(with: request){(data, response, error) in
                if let error = error{
                    print("Error: \(error)")
                } else if let data = data{
                    let json = try? JSONDecoder().decode(CharacterSkillSixData.self, from: data)
                    print(json)
                    
                    self.Character_six_skill_data_list.append(json!)
                }
            }
            task.resume()
        }
        else{
            print("Invalid URL")
        }
        
        if let invaild_V_url = URL(string: encoding_invaild_V_skill_url){
            var request = URLRequest(url: invaild_V_url)
            
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            let task = URLSession.shared.dataTask(with: request){(data, response, error) in
                if let error = error{
                    print("Error: \(error)")
                }else if let data = data{
                    let json = try? JSONDecoder().decode(CharacterVData.self, from: data)
                    print(json!)
                }
            }
            
            task.resume()
        }else{
            print("Invalid URL")
        }
        
        if let invaild_HEXA_url = URL(string : encoding_invaild_HEXA_skill_url){
            var request = URLRequest(url : invaild_HEXA_url)
            //하단에 addValue의 빈공간에 키 입력
            request.addValue("", forHTTPHeaderField: "x-nxopen-api-key")
            
            let task = URLSession.shared.dataTask(with: request){(data, response, error) in
                if let error = error{
                    print("Error: \(error)")
                }else if let data = data{
                    let json = try? JSONDecoder().decode(CharacterHexaData.self, from: data)
                    print(json!)
                }
            }
            task.resume()
        }else{
            print("Invalid URL")
        }
        
        
        
    }
}
