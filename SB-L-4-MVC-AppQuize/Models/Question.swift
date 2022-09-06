//
//  Question.swift
//  SB-L-4-MVC-AppQuize
//
//  Created by Sergey Nestroyniy on 06.09.2022.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answer: [Answer]
}

extension Question {
    static func getQuestions () -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answer: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .turtle),
                        Answer(text: "Кукуруза", type: .rabbit)
                     ]
                    ),
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answer: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .turtle),
                        Answer(text: "Кукуруза", type: .rabbit)
                     ]
                    ),
            Question(text: "Любите ли вы поездки на машине?",
                     type: .range,
                     answer: [
                        Answer(text: "Обожаю", type: .dog),
                        Answer(text: "Обожаю", type: .cat),
                        Answer(text: "Ненавижу", type: .turtle),
                        Answer(text: "Ненавижу", type: .rabbit)
                     ]
                    )
        ]
    }
}
