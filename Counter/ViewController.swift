//
//  ViewController.swift
//  Counter
//
//  Created by Danil Otmakhov on 06.10.2024.
//

import UIKit

class ViewController: UIViewController {
    var counter: Int = 0
    let dateFormatter = DateFormatter()
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var changesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        
    }
    
    @IBAction func plusButtonDidTap() {
        let date = Date()
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        changesText.text += "\n\(dateFormatter.string(from: date)): значение изменено на +1"
        changesText.scrollRangeToVisible(changesText.selectedRange)
    }
    
    @IBAction func minusButtonDidTap() {
        let date = Date()
        if counter == 0 {
            changesText.text += "\n\(dateFormatter.string(from: date)): попытка уменьшить значение счётчика ниже 0"
            changesText.scrollRangeToVisible(changesText.selectedRange)
            return
        }
        counter -= 1
        counterLabel.text = "Значение счётчика: \(counter)"
        changesText.text += "\n\(dateFormatter.string(from: date)): значение изменено на -1"
        changesText.scrollRangeToVisible(changesText.selectedRange)
    }
    
    @IBAction func resetButtonDidTap() {
        let date = Date()
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        changesText.text += "\n\(dateFormatter.string(from: date)): значение сброшено"
        changesText.scrollRangeToVisible(changesText.selectedRange)
    }
}

