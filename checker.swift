
func getCorrectAnswer(_ task: String) -> String {
    let start = DispatchTime.now()
    
    var elements = [Int]()
    let data = task.components(separatedBy: "\n")
    var result = ""
    for index in 0..<data.count - 1 {
        if data[index] == "pop" {
            elements = elements.sorted()
            if elements.count > 0 {
                result += "\(elements[0])\n"
                elements.remove(at: 0)
            } else {
                result += "nil\n"
            }
        } else if data[index] == "top" {
            elements = elements.sorted()
            if elements.count > 0 {
                result += "\(elements[0])\n"
            } else {
                result += "nil\n"
            }
        } else {
            elements.append(Int(data[index])!)
        }
    }
    
    let end = DispatchTime.now()
    
    let interval = end.uptimeNanoseconds - start.uptimeNanoseconds
    print("elapsed within \(interval.beautifulString) nanosecs")
    result += "\nelapsed within \(interval.beautifulString) nanosecs."
    
    return result
}
