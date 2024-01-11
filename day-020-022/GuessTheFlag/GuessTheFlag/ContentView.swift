//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ifeoluwa Lawal on 1/3/24.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Ireland", "Germany", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var gameMessage = ""
    @State private var score = 0
    @State private var questionsGiven = 0
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            /*
             LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
             .ignoresSafeArea()
             Color.blue
             .ignoresSafeArea()
             */
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 30) {
                    VStack() {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                            .fontWeight(.bold)
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                        // .alert()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                // .clipShape(Rectangle().cornerRadius(20))
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(gameMessage)
        }

    }
    
    func flagTapped(_ number: Int) {
        questionsGiven += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            gameMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            score -= 1
            gameMessage = "Wrong! That's the flag of \(countries[number]). \n Your score is \(score)"
            /*
            if score < 0 {
               score = 0
            }
             */
        }
        if questionsGiven >= 8 {
            gameMessage = "You've done 8 questions! Your final score is \(score)"
            score = 0
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
