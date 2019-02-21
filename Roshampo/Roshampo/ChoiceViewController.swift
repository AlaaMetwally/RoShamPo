//
//  ChoiceViewController.swift
//  Roshampo
//
//  Created by Geek on 12/24/18.
//  Copyright © 2018 Geek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction private func playRock(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender: sender)
        present(vc, animated: true, completion: nil)
    }
    @IBAction private func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender: sender as! UIButton)
        }
    }

    private func getUserShape(sender: UIButton) -> Shape{
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }

}


