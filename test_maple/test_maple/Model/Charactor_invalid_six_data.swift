// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterStatData = try? JSONDecoder().decode(CharacterStatData.self, from: jsonData)

import Foundation
import OptionallyDecodable // https://github.com/idrougge/OptionallyDecodable

// MARK: - CharacterStatData
struct CharacterHexaData: Codable {
    let date: String?
    let characterHexaCoreEquipment: [CharacterHexaCoreEquipment]?

    enum CodingKeys: String, CodingKey {
        case date
        case characterHexaCoreEquipment = "character_hexa_core_equipment"
    }
}

// MARK: - CharacterHexaCoreEquipment
struct CharacterHexaCoreEquipment: Codable {
    let hexaCoreName: String?
    let hexaCoreLevel: Int?
    let hexaCoreType: String?
    let linkedSkill: [LinkedSkill]?

    enum CodingKeys: String, CodingKey {
        case hexaCoreName = "hexa_core_name"
        case hexaCoreLevel = "hexa_core_level"
        case hexaCoreType = "hexa_core_type"
        case linkedSkill = "linked_skill"
    }
}

// MARK: - LinkedSkill
struct LinkedSkill: Codable {
    let hexaSkillID: String?

    enum CodingKeys: String, CodingKey {
        case hexaSkillID = "hexa_skill_id"
    }
}
