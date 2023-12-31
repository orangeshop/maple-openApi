import Foundation
import OptionallyDecodable // https://github.com/idrougge/OptionallyDecodable

// MARK: - CharacterStatData
struct CharacterVData: Codable {
    let date, characterClass: String?
    let characterVCoreEquipment: [CharacterVCoreEquipment]?
    let characterVMatrixRemainSlotUpgradePoint: Int?

    enum CodingKeys: String, CodingKey {
        case date
        case characterClass = "character_class"
        case characterVCoreEquipment = "character_v_core_equipment"
        case characterVMatrixRemainSlotUpgradePoint = "character_v_matrix_remain_slot_upgrade_point"
    }
}

// MARK: - CharacterVCoreEquipment
struct CharacterVCoreEquipment: Codable {
    let slotID: String?
    let slotLevel: Int?
    let vCoreName, vCoreType: String?
    let vCoreLevel: Int?
    let vCoreSkill1, vCoreSkill2, vCoreSkill3: String?

    enum CodingKeys: String, CodingKey {
        case slotID = "slot_id"
        case slotLevel = "slot_level"
        case vCoreName = "v_core_name"
        case vCoreType = "v_core_type"
        case vCoreLevel = "v_core_level"
        case vCoreSkill1 = "v_core_skill_1"
        case vCoreSkill2 = "v_core_skill_2"
        case vCoreSkill3 = "v_core_skill_3"
    }
}
