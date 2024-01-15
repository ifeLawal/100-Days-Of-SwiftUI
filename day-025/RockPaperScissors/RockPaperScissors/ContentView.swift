//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ifeoluwa Lawal on 1/14/24.
//

import SwiftUI

struct WeaponImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 200, maxHeight: 200)
            .padding()
            // .imageScale(.small)
            // .scaledToFit()
    }
}

struct Card: View {
    var weaponOfChoice: String
    
    var body: some View {
        Button(weaponOfChoice) {
            print("You selected \(weaponOfChoice)")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    private var options = ["Rock", "Paper", "Scissors"]
    @State private var cpuChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var playersChoice = ""
    @State private var numberOfRounds = 0
    @State private var showEndGameAlert = false
    
    // Toggle shouldWin
    // Check if the person won and if that matches the shouldWin bool
    // Have a score
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.0, green: 0.4, blue: 1.0, opacity: 0.4)
                    .ignoresSafeArea()
                VStack {
                    VStack(spacing: 10) {
                        Text("Cpu chose:")
                            .fontWeight(.semibold)
                        WeaponImage(imageName: options[cpuChoice])
                        Text("Choose your weapon")
                            .font(.title)
                        Text("You should: \(shouldWin ? "win" : "lose")")
                        Text("Score: \(score)")
                        HStack {
                            Button {
                                followedInstructions(playerWeapon: "Rock", cpuWeapon: options[cpuChoice])
                            } label: {
                                WeaponImage(imageName: "Rock")
                            }
                            Button {
                                followedInstructions(playerWeapon: "Scissors", cpuWeapon: options[cpuChoice])
                            } label: {
                                WeaponImage(imageName: "Scissors") 
                            }
                            
                            Button {
                                followedInstructions(playerWeapon: "Paper", cpuWeapon: options[cpuChoice])
                            } label: {
                                WeaponImage(imageName: "Paper")
                            }
                        }.alert("Game has ended you got a score of \(score)", isPresented: $showEndGameAlert) {
                            Button("Ok", action: restartGame)
                        }
                    }
                    .padding()
                }
            }.navigationTitle("Rock Paper Scissors")
                
        }
    }
    
    func followedInstructions(playerWeapon: String, cpuWeapon: String) {
        cpuChoice = Int.random(in: 0...2)
        numberOfRounds += 1
        updateScore(playerWeapon: playerWeapon, cpuWeapon: cpuWeapon)
        if (numberOfRounds >= 10) {
            showEndGameAlert = true
        }
    }
    func updateScore(playerWeapon: String, cpuWeapon: String) {
        switch(playerWeapon) {
        case "Rock":
            if shouldWin {
                if cpuWeapon == "Scissors" {
                    score += 1
                } else if cpuWeapon == "Paper" {
                    score -= 1
                }
            } else {
                if cpuWeapon == "Paper" {
                    score += 1
                } else if cpuWeapon == "Scissors" {
                    score -= 1
                }
            }
            shouldWin.toggle()
        case "Paper":
            if shouldWin {
                if cpuWeapon == "Rock" {
                    score += 1
                } else if cpuWeapon == "Scissors" {
                    score -= 1
                }
            } else {
                if cpuWeapon == "Scissors" {
                    score += 1
                } else if cpuWeapon == "Rock" {
                    score -= 1
                }
            }
            shouldWin.toggle()
        case "Scissors":
            if shouldWin {
                if cpuWeapon == "Paper" {
                    score += 1
                } else if cpuWeapon == "Rock" {
                    score -= 1
                }
            } else {
                if cpuWeapon == "Rock" {
                    score += 1
                } else if cpuWeapon == "Paper" {
                    score -= 1
                }
            }
            shouldWin.toggle()
        default:
            shouldWin.toggle()
        }
    }
    func restartGame() {
        score = 0
        numberOfRounds = 0
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
