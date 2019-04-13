//
//  ViewController.swift
//  WordList
//
//  Created by 松尾大雅 on 2019/04/12.
//  Copyright © 2019 松尾大雅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //FinishViewControllerまで行った時にスタート画面に戻ってくるためのメソッド
    @IBAction func back(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtonTapped() {
        let saveData = UserDefaults.standard
        
        if let wordArray = saveData.array(forKey: "WORD") {
            if wordArray.count > 0 {
                self.performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "単語", message: "まずは「単語一覧」をタップして単語登録をしてください。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
}




