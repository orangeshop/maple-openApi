import Foundation
import OptionallyDecodable

struct CharacterStatData: Codable {
    let characterClass: String?
    let finalStat: [FinalStat]?
    let remainAp: Int?

    enum CodingKeys: String, CodingKey {
        case characterClass = "character_class"
        case finalStat = "final_stat"
        case remainAp = "remain_ap"
    }
}

// MARK: - FinalStat
struct FinalStat: Codable {
    let statName, statValue: String?

    enum CodingKeys: String, CodingKey {
        case statName = "stat_name"
        case statValue = "stat_value"
    }
}
