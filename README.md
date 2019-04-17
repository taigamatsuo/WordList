# WordList




***

この処理のalertの部分が理解できなかったが、そのまま書き写してしまった

```word.swift
/保存ボタンが押された時のsaveWord()メソッド
    @IBAction func saveWord() {
        //wordDictionaryという辞書に値を入れる
        let wordDictionary = ["english": englishTextField.text!,"japanese": japaneseTextFiled.text!]
        //辞書を配列に追加(append)する
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        print(wordArray)
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
```
