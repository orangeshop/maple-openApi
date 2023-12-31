// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characterEquimentData = try? JSONDecoder().decode(CharacterEquimentData.self, from: jsonData)

import Foundation
import OptionallyDecodable 

// MARK: - CharacterEquimentData
struct character_equiment_data: Codable {
    let date, characterGender, characterClass: String?
    let itemEquipment: [Equipment]?
    let title: Title?
    let dragonEquipment, mechanicEquipment: [Equipment]?

    enum CodingKeys: String, CodingKey {
        case date
        case characterGender = "character_gender"
        case characterClass = "character_class"
        case itemEquipment = "item_equipment"
        case title
        case dragonEquipment = "dragon_equipment"
        case mechanicEquipment = "mechanic_equipment"
    }
}

// MARK: - Equipment
struct Equipment: Codable {
    let itemEquipmentPart, equipmentSlot, itemName, itemIcon: String?
    let itemDescription, itemShapeName, itemShapeIcon, gender: String?
    let itemTotalOption, itemBaseOption: ItemAddOptionClass?
    let equipmentLevelIncrease: Int?
    let itemExceptionalOption: ItemExceptionalOption?
    let itemAddOption: ItemAddOptionClass?
    let growthExp, growthLevel: Int?
    let scrollUpgrade, cuttableCount, goldenHammerFlag, scrollResilienceCount: String?
    let scrollUpgradeableCount, soulName, soulOption: String?
    let itemEtcOption: ItemEtcOptionClass?
    let starforce, starforceScrollFlag: String?
    let itemStarforceOption: ItemEtcOptionClass?
    let specialRingLevel: Int?
    let dateExpire, potentialOptionGrade, additionalPotentialOptionGrade, potentialOption1: String?
    let potentialOption2, potentialOption3, additionalPotentialOption1, additionalPotentialOption2: String?
    let additionalPotentialOption3: String?

    enum CodingKeys: String, CodingKey {
        case itemEquipmentPart = "item_equipment_part"
        case equipmentSlot = "item_equipment_slot"
        case itemName = "item_name"
        case itemIcon = "item_icon"
        case itemDescription = "item_description"
        case itemShapeName = "item_shape_name"
        case itemShapeIcon = "item_shape_icon"
        case gender
        case itemTotalOption = "item_total_option"
        case itemBaseOption = "item_base_option"
        case equipmentLevelIncrease = "equipment_level_increase"
        case itemExceptionalOption = "item_exceptional_option"
        case itemAddOption = "item_add_option"
        case growthExp = "growth_exp"
        case growthLevel = "growth_level"
        case scrollUpgrade = "scroll_upgrade"
        case cuttableCount = "cuttable_count"
        case goldenHammerFlag = "golden_hammer_flag"
        case scrollResilienceCount = "scroll_resilience_count"
        case scrollUpgradeableCount = "scroll_upgradeable_count"
        case soulName = "soul_name"
        case soulOption = "soul_option"
        case itemEtcOption = "item_etc_option"
        case starforce
        case starforceScrollFlag = "starforce_scroll_flag"
        case itemStarforceOption = "item_starforce_option"
        case specialRingLevel = "special_ring_level"
        case dateExpire = "date_expire"
        case potentialOptionGrade = "potential_option_grade"
        case additionalPotentialOptionGrade = "additional_potential_option_grade"
        case potentialOption1 = "potential_option_1"
        case potentialOption2 = "potential_option_2"
        case potentialOption3 = "potential_option_3"
        case additionalPotentialOption1 = "additional_potential_option_1"
        case additionalPotentialOption2 = "additional_potential_option_2"
        case additionalPotentialOption3 = "additional_potential_option_3"
    }
}

// MARK: - ItemAddOptionClass
struct ItemAddOptionClass: Codable {
    let str, dex, int, luk: String?
    let maxHP, maxMp, attackPower, magicPower: String?
    let armor, speed, jump, bossDamage: String?
    let damage, allStat: String?
    let equipmentLevelDecrease: Int?
    let ignoreMonsterArmor, maxHPRate, maxMpRate: String?
    let baseEquipmentLevel: Int?

    enum CodingKeys: String, CodingKey {
        case str, dex, int, luk
        case maxHP = "max_hp"
        case maxMp = "max_mp"
        case attackPower = "attack_power"
        case magicPower = "magic_power"
        case armor, speed, jump
        case bossDamage = "boss_damage"
        case damage
        case allStat = "all_stat"
        case equipmentLevelDecrease = "equipment_level_decrease"
        case ignoreMonsterArmor = "ignore_monster_armor"
        case maxHPRate = "max_hp_rate"
        case maxMpRate = "max_mp_rate"
        case baseEquipmentLevel = "base_equipment_level"
    }
}

// MARK: - ItemEtcOptionClass
struct ItemEtcOptionClass: Codable {
    let str, dex, int, luk: String?
    let maxHP, maxMp, attackPower, magicPower: String?
    let armor, speed, jump: String?

    enum CodingKeys: String, CodingKey {
        case str, dex, int, luk
        case maxHP = "max_hp"
        case maxMp = "max_mp"
        case attackPower = "attack_power"
        case magicPower = "magic_power"
        case armor, speed, jump
    }
}

// MARK: - ItemExceptionalOption
struct ItemExceptionalOption: Codable {
    let str, dex, int, luk: String?
    let maxHP, maxMp, attackPower, magicPower: String?

    enum CodingKeys: String, CodingKey {
        case str, dex, int, luk
        case maxHP = "max_hp"
        case maxMp = "max_mp"
        case attackPower = "attack_power"
        case magicPower = "magic_power"
    }
}

// MARK: - Title
struct Title: Codable {
    let titleName, titleIcon, titleDescription, dateExpire: String?
    let dateOptionExpire: String?

    enum CodingKeys: String, CodingKey {
        case titleName = "title_name"
        case titleIcon = "title_icon"
        case titleDescription = "title_description"
        case dateExpire = "date_expire"
        case dateOptionExpire = "date_option_expire"
    }
}

