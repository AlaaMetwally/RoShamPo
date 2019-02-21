//
//  ResultsViewController.swift
//  Roshampo
//
//  Created by Geek on 12/29/18.
//  Copyright © 2018 Geek. All rights reserved.
//

import UIKit

enum Shape: String{
    case Paper = "paper"
    case Rock = "rock"
    case Scissors = "scissors"
    static func randomShape() -> Shape{
        let shapes = ["rock","paper","scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}
class ResultsViewController: UIViewController {
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    var userChoice: Shape!
    let opponentChoice: Shape = Shape.randomShape()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult();
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func displayResult(){
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "itsATie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }
}



