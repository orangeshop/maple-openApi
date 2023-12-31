// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterSkillSixData = try? JSONDecoder().decode(CharacterSkillSixData.self, from: jsonData)

import Foundation
import OptionallyDecodable // https://github.com/idrougge/OptionallyDecodable

// MARK: - CharacterSkillSixData
struct CharacterSkillSixData: Codable {
    let date, characterClass, characterSkillGrade: String?
    let characterSkill: [CharacterSkill]?

    enum CodingKeys: String, CodingKey {
        case date
        case characterClass = "character_class"
        case characterSkillGrade = "character_skill_grade"
        case characterSkill = "character_skill"
    }
}

// MARK: - CharacterSkill
//struct CharacterSkill: Codable {
//    let skillName, skillDescription: String?
//    let skillLevel: Int?
//    let skillEffect, skillIcon: String?
//
//    enum CodingKeys: String, CodingKey {
//        case skillName = "skill_name"
//        case skillDescription = "skill_description"
//        case skillLevel = "skill_level"
//        case skillEffect = "skill_effect"
//        case skillIcon = "skill_icon"
//    }
//}
