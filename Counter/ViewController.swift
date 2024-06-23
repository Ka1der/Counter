//
//  ViewController.swift
//  Counter
//
//  Created by Kaider on 23.06.2024.
//

import UIKit
import Foundation

private var counter = 0

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var munisButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var historyFeild: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelCounter.text = "Значение счетчика: \(counter)"
        historyFeild.text = ""
        historyFeild.isEditable = false
        labelCounter.font = UIFont.boldSystemFont(ofSize: 15)
    }
    // функция обновления времени к каждому изменению
    func updateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
    // отработка нажания +
    @IBAction func buttonDidTapPlusCounter(_ sender: Any) {
        counter += 1
        labelCounter.text = "Значение счетчика: \(counter)"
        
        let newCount = "\(updateTime()) Значение изменено на +1\n"
        historyFeild.text += newCount
        
        let scrollHistoryField = NSMakeRange(historyFeild.text.count - 1, 1)
        historyFeild.scrollRangeToVisible(scrollHistoryField)
    }
    // отработка нажания -
    @IBAction func buttonDidTapMinusCounter(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            labelCounter.text = "Значение счетчика: \(counter)"
            
            let newCount = "\(updateTime()) Значение изменено на -1\n"
            historyFeild.text += newCount
            
            let scrollHistoryField = NSMakeRange(historyFeild.text.count - 1, 1)
            historyFeild.scrollRangeToVisible(scrollHistoryField)
        } else {
            if counter <= 0 {
                counter = 0
                
            let negativeCount = "\(updateTime()) Попытка уменьшения значения счетчика ниже 0\n"
            historyFeild.text += negativeCount
                
            let scrollHistoryField = NSMakeRange(historyFeild.text.count - 1, 1)
            historyFeild.scrollRangeToVisible(scrollHistoryField)
                }
            }
        }
    // отработка нажания сброс
    @IBAction func buttotDidTapResetCounter(_ sender: Any) {
        counter = 0
        labelCounter.text = "Значение счетчика: \(counter)"
        
        let newCount = "\(updateTime()) Значение сброшено\n"
        historyFeild.text += newCount
        
        let scrollHistoryField = NSMakeRange(historyFeild.text.count - 1, 1)
        historyFeild.scrollRangeToVisible(scrollHistoryField)
    }
}

