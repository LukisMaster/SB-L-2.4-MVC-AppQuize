//
//  Answer.swift
//  SB-L-4-MVC-AppQuize
//
//  Created by Sergey Nestroyniy on 06.09.2022.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var defenition: String {
        switch self {
        case .dog: return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat: return "Кошка"
        case .rabbit: return "Кролик"
        case .turtle: return "Черепаха"
        }
    }
}

struct Answer {
    let text: String
    let type: AnimalType
}
