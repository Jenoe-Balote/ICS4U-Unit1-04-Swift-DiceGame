//
//  DiceGame.swift
//
//  Created by Jenoe Balote
//  Created on 2021-11-24
//  Version 1.0
//  Copyright (c) 2021 Jenoe Balote. All rights reserved.
//
//  This program generates a random number between one and six, then
//  gets the user to guess it.
//

import Foundation

// This function generates a random number
func randomNumberGenerator(lowestNum: Int, highestNum: Int) -> Int {
    return Int.random(in: lowestNum...highestNum)
}

// This function returns whether the guess was too high or too low
func tooHighOrLow(guess: Int, randomNum: Int) -> String {
    return guess > randomNum ? "Guessed too high!" : "Guessed too low!"
}

// Constants
let lowestNum = 1
let highestNum = 6

// Sets random number for the rest of the game
let randomNum = randomNumberGenerator(lowestNum: lowestNum,
    highestNum: highestNum)

var numOfTries = 0

print("Welcome to the Dice Game!")

while true {

    // Input
    print("Guess a number between 1 and 6: ", terminator: "")

    // Gathers the user input and error checks
    guard let guessString = readLine(), !guessString.isEmpty else {
        print("Please enter a correct input.")
        continue
    }

    // Tries to parse the user input into an Int
    if let guess = Int(guessString) {

        // Correct answer
        if guess == randomNum {
            numOfTries += 1
            print("\nCorrect!")
            print("It took you \(numOfTries) tries.")
            break
        } else {
            numOfTries += 1
            print(tooHighOrLow(guess: guess, randomNum: randomNum))
            print("Guess again.\n")
        }

    } else {
        print("Please enter a correct input\n")
    }

}

print("\nDone.")
