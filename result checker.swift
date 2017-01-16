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
