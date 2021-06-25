class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var currentSentence = [String]()
        var currentSentenceLength = 0
        var result = [String]()
        for word in words {
            guard word.length != maxWidth else {
                if currentSentence.count > 0 {
                    result.append(resultString(currentSentence, maxWidth, currentSentenceLength))
                }
                result.append(word)
                currentSentence.removeAll()
                currentSentenceLength = 0
                continue
            }
            if currentSentenceLength + word.length + currentSentence.count > maxWidth {
                result.append(resultString(currentSentence, maxWidth, currentSentenceLength))
                currentSentence.removeAll()
                currentSentenceLength = 0
            }
            currentSentenceLength += word.length
            currentSentence.append(word)
        }
        if currentSentence.count == 0 {
            return result
        }
        var interResult = ""
        var i = 0
        for word in currentSentence {
            if i == currentSentence.count - 1 {
                interResult = interResult + word
            } else {
                interResult = interResult + word + " "
                currentSentenceLength += 1
            }
            i += 1
        }
        i = currentSentenceLength
        while i < maxWidth {
            interResult += " "
            i += 1
        }
        result.append(interResult)
        return result
    }
    
    func resultString(_ currentSentence: [String], _ maxWidth: Int, _ currentSentenceLength: Int) -> String {
        var string = ""
        if currentSentence.count == 1 {
            return currentSentence[0] + String(repeating: " ", count: maxWidth - currentSentenceLength)
        }
        var unevenSpaces = (maxWidth - currentSentenceLength) % (currentSentence.count - 1)
        var minSpaces = (maxWidth - currentSentenceLength - unevenSpaces)/(currentSentence.count - 1)
        var spaceDist = [String](repeating: String(repeating: " ", count: minSpaces), count: currentSentence.count - 1)
        var i = 0
        while unevenSpaces > 0 {
            spaceDist[i] = spaceDist[i] + " "
            unevenSpaces -= 1
            i += 1
            i = i % spaceDist.count
        }
        i = 0
        for word in currentSentence {
            if i < spaceDist.count {
                string = string + word + spaceDist[i]
            } else {
                string = string + word
            }
            i += 1
        }
        return string
    }
}