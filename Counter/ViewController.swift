//
//  ViewController.swift
//  Counter
//
//  Created by Danil Otmakhov on 06.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak private var counterUILabel: UILabel!
    @IBOutlet weak private var changesTextUIView: UITextView!
    
    private var counter: Int = 0
    private let dateFormatter = DateFormatter()
    private let defaults = UserDefaults.standard
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateFormat()
        readData()
    }
    
    //MARK: - Methods
    private func setDateFormat() {
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
    }
    
    private func loadData() {
        defaults.set(counter, forKey: "counterValue")
        defaults.set(changesTextUIView.text, forKey: "changes")
    }
    
    private func readData() {
        counter = defaults.integer(forKey: "counterValue")
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text = defaults.string(forKey: "changes") ?? "История изменений:"
    }
    
    //MARK: - Actions
    @IBAction private func plusButtonDidTap() {
        let date = Date()
        counter += 1
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text += "\n\(dateFormatter.string(from: date)): значение изменено на +1"
        changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
        loadData()
    }
    
    @IBAction private func minusButtonDidTap() {
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
        loadData()
    }
    
    @IBAction private func resetButtonDidTap() {
        let date = Date()
        counter = 0
        counterUILabel.text = "Значение счётчика: \(counter)"
        changesTextUIView.text += "\n\(dateFormatter.string(from: date)): значение сброшено"
        changesTextUIView.scrollRangeToVisible(changesTextUIView.selectedRange)
        loadData()
    }
}

