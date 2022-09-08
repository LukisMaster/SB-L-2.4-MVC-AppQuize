//
//  FinalViewController.swift
//  SB-L-4-MVC-AppQuize
//
//  Created by Sergey Nestroyniy on 06.09.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet var navigatinBar: UINavigationItem!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var allAnswers : [Answer] = []
        
    //1. Передать массив с ответами
    //2. Определить наиболее часто встречающийся тип животного
    //3. Отобразить результаты на экране
    //4. Избавиться от кнопки возврата  предыдущий экран
    
    override func viewDidLoad() {
        let answer = getAnswer (answers: allAnswers)
        typeLabel.text = "Вы - \(answer.rawValue)"
        answerLabel.text = answer.defenition
        
        navigatinBar.hidesBackButton = true
    }

    override func viewWillLayoutSubviews() {

    }
    
    private func getAnswer (answers: [Answer]) -> AnimalType {
        var answerDict : [AnimalType : Int] = [.dog: 0, .cat: 0, .rabbit: 0, .turtle: 0]
        for value in answers {
            answerDict[value.type]! += 1
        }
        
        let maxCount = answerDict.values.max()
        for item in answerDict {
            if item.value == maxCount {
                return item.key
                
            }
        }
        return AnimalType.dog
    }

}
