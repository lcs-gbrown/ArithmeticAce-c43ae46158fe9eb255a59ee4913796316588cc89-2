//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct SubtractionView: View {
    
    // MARK: Stored properties
    @State var minuend = Int.random(in: 1...12)
    @State var subtrahend = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return minuend - subtrahend
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            HStack {
                Text("-")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(minuend)")
                    Text("\(subtrahend)")
                }
            }
            
            Divider()
            
            ZStack {
               
                if answerCorrect {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .padding()
                        .opacity(answerCorrect ? 1.0 : 0.0)
                }
                else {
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        .padding()
                        .opacity(answerCorrect == false && answerChecked == true ? 1.0 : 0.0)
                }
            
                Spacer()
                TextField("",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            
            ZStack {
                Button(action: {
                    
                    // Answer has been checked!
                    answerChecked = true
                    
                    // Convert the input given to an integer, if possible
                    guard let productGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }

                    // Check the answer!
                    if productGiven == correctSum {
                        // Celebrate! 👍🏼
                        answerCorrect = true
                    } else {
                        // Sadness, they gave a number, but it's correct 😭
                        answerCorrect = false
                    }
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                    .opacity(answerChecked == false ? 1.0 : 0.0)
                
                Button(action: {
                    // Generate new numbers
                    minuend = Int.random(in: 1...12)
                    subtrahend = Int.random(in: 1...12)
                
                    //Reset the properties that we use to keep track of
                    //whether a question has been answered and whether the
                    //answer is correct
                    answerChecked = false
                    answerCorrect = false
                    
                    //Reset the field where the user gives an answer
                    inputGiven = ""
                
                }, label: {
                    
                    Text("New Question")
                        .font(.largeTitle)
                    
                })
                    .padding()
                    .buttonStyle(.bordered)
                
                    .opacity(answerChecked == true ? 1.0 : 0.0)
            }

            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))

        
    }
}

struct Subtraction_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
