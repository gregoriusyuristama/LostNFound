//
//  StringMatching.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

func isWordInSentence(_ word: String, _ sentence: String) -> Bool {
    let targetWords = word.lowercased().components(separatedBy: .whitespaces)
    let sentenceWords = sentence.lowercased().components(separatedBy: .whitespaces)

    // Calculate Jaccard similarity between two word sequences
    func jaccardSimilarity(_ s1: Set<String>, _ s2: Set<String>) -> Double {
        let intersection = s1.intersection(s2)
        let union = s1.union(s2)
        return Double(intersection.count) / Double(union.count)
    }

    // Find the best matching word sequence in the sentence
    var bestMatchSimilarity = 0.0
    for i in 0...(sentenceWords.count - targetWords.count) {
        let currentSentenceWords = Set(sentenceWords[i...(i + targetWords.count - 1)])
        let similarity = jaccardSimilarity(Set(targetWords), currentSentenceWords)
        bestMatchSimilarity = max(bestMatchSimilarity, similarity)
    }

    // Set a threshold for similarity: 0.5 = 50% similarity
    return bestMatchSimilarity >= 0.5
}

