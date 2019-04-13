//
//  AddViewController.swift
//  WordList
//
//  Created by 松尾大雅 on 2019/04/12.
//  Copyright © 2019 松尾大雅. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextFiled: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        // Do any additional setup after loading the view.
    }
    
    //保存ボタンが押された時のsaveWord()メソッド
    @IBAction func saveWord() {
        //wordDictionaryという辞書に値を入れる
        let wordDictionary = ["english": englishTextField.text!,"japanese": japaneseTextFiled.text!]
        //辞書を配列に追加(append)する
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextFiled.text = ""
    }

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
