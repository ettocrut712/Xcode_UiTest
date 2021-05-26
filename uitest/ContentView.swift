//
//  ContentView.swift
//  uitest
//
//  Created by Normand Turcotte on 2021-04-28.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card2"
    @State var cpuCard = "card2"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var coups = 0
    @State var userName = ""
    @State private var rotation: Double = 0
    
    var body: some View {
      
      
        ZStack{
            
            Image("background")
                .ignoresSafeArea()
            
            
            
            VStack{
                Spacer()
                
                Image("logo")
                Spacer()

                TextField("     Entrer le nom:", text: $userName)
                    .font(.headline)
                    .foregroundColor(.red)
                    .rotationEffect(.degrees(rotation))
                     0.0))
                
                //Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                        .rotationEffect(.degrees(rotation))
                        .rotation3DEffect(
                            .degrees(rotation),
                            axis: (x: 0.5, y: 1.0, z: 0.8)
                        )
                        .animation(.easeIn(duration: 5))
                    
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                HStack {
                    Slider(value: $rotation, in: 0...360, step: 0.1)
                    Spacer()
                }
                               
                
                Button(action: {
                    
                    // generate random number between 2 and 14 (card number)
                    
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)

                    // MARK: update card number to display

                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)

                    // update score

                    if (playerRand > cpuRand) {playerScore += 1}
                    else if (playerRand < cpuRand){cpuScore += 1}
                    coups += 1
                }, label: {
                    Image("dealbutton")
                    
                    Text(String(coups))
                        .padding(.top, 12.0)
                })
                
                //MARK: deal button ici..
                
                HStack {
                    
                    Spacer()
                }
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .padding()
                            
                        
                        Text(String(playerScore))
                            .padding(.top, 12.0)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.red)
                            
                            
                        Text(String(cpuScore))
                            .padding(.top, 12.0)
                        
                    }
                    Spacer()
                }
                Spacer()
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            
        }
    }
}
