//
//  QuestionViewController.swift
//  SB-L-4-MVC-AppQuize
//
//  Created by Sergey Nestroyniy on 06.09.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float (currentAnswers.count - 1)
            rangedSlider.value = answerCount // тут же изменится и maximumValue!!!!
        }
    }
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    // MARK: - Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answerChoosen = [Answer]()
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {
            return
        }
        
        let currentAnswer = currentAnswers[currentIndex]
        answerChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        
        nextQuestion()
        
    }
    
    @IBAction func rangedAnswerPressed() {
        let index = Int(rangedSlider.value)
        answerChoosen.append(currentAnswers[index])
        
        nextQuestion()

    }
    
}

// MARK: - Private
extension QuestionViewController {
    private func updateUI() {
        //Hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        //get current question (0)
        let currentQuestion = questions[questionIndex]
        
        //set current question for label
        questionLabel.text = currentQuestion.text
        
        //calculate progress and set to progressView
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        //set current number question in title navbar
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        //show current stack view
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView (for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView (with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView (with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView (with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

// MARK: - performData
extension QuestionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! FinalViewController
        destVC.allAnswers = answerChoosen
    }
}

