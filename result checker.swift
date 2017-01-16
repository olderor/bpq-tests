func checkAllTests() {
    var result = ""
    for i in 0..<50 {
        let isCorrect = checkAnswer(index: i)
        if isCorrect {
            result += "Test #\(i) - OK.\n"
            print("Test #\(i) - OK.\n")
        } else {
            result += "Test #\(i) - WA.\n"
            print("Test #\(i) - WA.\n")
        }
    }
    print(result)
    BYFileManager.writeFile(path: "check_result", content: result)
}

func checkAnswer(index: Int) -> Bool {
    print("checking \(index) test...")
    let myAnswer = BYFileManager.readFile(path: "\(index)t")
    let correctAnswer = BYFileManager.readFile(path: "\(index)a").replacingOccurrences(of: "\r\n", with: "\n")
    print("done!")
    
    let myData = myAnswer.components(separatedBy: "\n")
    let correctData = correctAnswer.components(separatedBy: "\n")
    
    if myData.count != correctData.count {
        return false
    }
    
    for i in 0..<myData.count - 1 {
        if myData[i] != correctData[i] {
            return false
        }
    }
    
    return true
}
