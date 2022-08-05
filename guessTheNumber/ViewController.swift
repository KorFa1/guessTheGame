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
            print("Your guess should be between 1 and 100!")
        } else if guess < numberToGuess {
            print("Higher!")
        } else if guess > numberToGuess {
            print("Lower!")
        } else {
            print("You win!")
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }

}

