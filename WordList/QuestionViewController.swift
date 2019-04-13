//
//  QuestionViewController.swift
//  WordList
//
//  Created by 松尾大雅 on 2019/04/12.
//  Copyright © 2019 松尾大雅. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false    //回答したか・次の問題いくかの判定
    var wordArray: [Dictionary<String, String>] = []    //UserDefaultsからとる配列
    var shuffledWordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0  //現在の回答数
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
    }
    
    //viewが現れた時に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフルする
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonTapped() {
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordArray.count {
                //次の問題を表示する
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                //isAnsweredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更する
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                //これ以上表示する問題がないので、Finishビューに遷移
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            //答えを表示する
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            //isAnswerdをtrueにする
            isAnswered = true
            //ボタンのタイトルを変更する
            nextButton.setTitle("次へ", for: .normal)
        }
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
