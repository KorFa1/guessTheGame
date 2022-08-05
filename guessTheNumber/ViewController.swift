//
//  ViewController.swift
//  guessTheNumber
//
//  Created by Кирилл Софрин on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBAction func guessButton(_ sender: Any) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses += 1
                validateGuess(guessInt)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }

    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower! ⬇️"
        } else {
            showWinAlert()
            guessLabel.text = "Guess the number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        guessTextField.text = ""
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Warning!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

