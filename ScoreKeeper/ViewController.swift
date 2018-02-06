//
//  ViewController.swift
//  ScoreKeeper
//
//  Created by Josiah Mory on 2/6/18.
//  Copyright © 2018 kickinbahk Productions. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var userTextInput: NSTextView!
    @IBOutlet weak var totalScoresLabel: NSTextField!
    @IBOutlet weak var calculateButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculate(_ sender: Any) {
        let userText = userTextInput.string
        let lineArray = splitLines(multiLineString: userText)
        var returnedString = ""
        var total = 0
        
        for line in lineArray {
            let returnedData = calculateScoreForPlayer(string: line)
            total += returnedData.score
            
            returnedString += "\(returnedData.player): \(returnedData.score)\n"
        }
        
        returnedString += "\nTotal: \(total)"
        
        totalScoresLabel.stringValue = returnedString
    }
    
    func splitLines(multiLineString: String) -> [String] {
        var strings = [String]()
        let lines = multiLineString.split(separator: "\n")
        
        for line in lines {
            strings.append(String(line))
        }
        
        return strings
        
    }
    
    func calculateScoreForPlayer(string: String) -> (player: String, score: Int) {
        var splitString = string.split(separator: " ")
        let player = splitString[0]
        let total = calculateScore(string: "\(splitString[1])")
        
        return (player: "\(player)", score: total)
    }
    
    func calculateScore(string: String) -> Int {
        var score = 0
        let scoresArray = string.split(separator: "+")
        for scoreString in scoresArray {
            if let scoreInt = Int(scoreString) {
                score += scoreInt
            }
        }
        
        return score
    }
}

