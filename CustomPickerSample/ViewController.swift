//
//  ViewController.swift
//  CustomPickerSample
//
//  Created by 藤井陽介 on 2018/03/26.
//  Copyright © 2018 Swimee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - ここから
    @IBOutlet var pickerView: UIPickerView!
    var selectedHour: Int = 0
    var selectedMinutes: Int = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        // 何列あるか
        return 3
    }
    
    // 一列にある要素の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            // 時
            return 24
        } else if component == 2{
            
            // 分
            return 60
        } else {
            
            // 間のコロン
            return 1
        }
    }
    
    // MARK: Delegate
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        if component == 1 {
            // 間のコロンも自分で入れてあげる
            pickerLabel.text = ":"
        } else {
            // 01, 02, 03...というようにする
            pickerLabel.text = String(format: "%02d", row)
            // 色変えたりとかはここで
            pickerLabel.textColor = .red
        }
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    
    // ピッカーの選択を切り替えたタイミングで変数に時間を別々で入れてあげる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            
            selectedHour = row
        } else if component == 2 {
            
            selectedMinutes = row
        }
    }
    
    func selectedTime() -> Date {
        
        let calendar = Calendar(identifier: .gregorian)
        
        // とりあえず今日の選択した時間を返す
        // 明日の日付などはまたカスタマイズできるはず
        return calendar.date(bySettingHour: selectedHour, minute: selectedMinutes, second: 0, of: Date())!
    }
}

