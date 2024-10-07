//
//  ViewController.swift
//  Counter
//
//  Created by Danil Otmakhov on 06.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    private var counter: Int = 0
    private let dateFormatter = DateFormatter()
    @IBOutlet weak var counterUILabel: UILabel!
    @IBOutlet weak var changesTextUIView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        
    }
    
    @IBAction func plusButtonDidTap() {
        let date = Date()
        counter += 1
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text += "\n\(dateFormatter.string(from: date)): значение изменено на +1"
        changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
    }
    
    @IBAction func minusButtonDidTap() {
        let date = Date()
        if counter == 0 {
            changesTextUIView.text += "\n\(dateFormatter.string(from: date)): попытка уменьшить значение счётчика ниже 0"
            changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
            return
        }
        counter -= 1
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text += "\n\(dateFormatter.string(from: date)): значение изменено на -1"
        changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
    }
    
    @IBAction func resetButtonDidTap() {
        let date = Date()
        counter = 0
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text += "\n\(dateFormatter.string(from: date)): значение сброшено"
        changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
    }
}

