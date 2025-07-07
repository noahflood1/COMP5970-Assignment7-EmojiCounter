//
//  ContentView.swift
//  EmojiCounterV2
//
//  Created by Noah Flood on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainStack()
    }
}

struct MainStack: View {
    
    @State private var foodItems: [String] = ["🍕", "🍔", "🍪", "🍉", "🍗"]
    //@State var counterValues: [Int] = [0, 0, 0, 0, 0] // hard coding this seems like a bad idea...
    // here is a way that requires less changing in thec ase that i want to add more emojis.
    @State private var counters: [Int] = Array(repeating: 0, count: 5)
    
    var body: some View {
        VStack {
            Text("Order Food by Emoji")
                .font(.largeTitle)
                .bold()
                .padding(.top)
                .multilineTextAlignment(.center) // make the title centered
            List {
                // how I was doing it before
                //                ForEach(foodItems, id: \.self) { food in
                //                    ListItem(emoji: food)
                //                }
                //                .padding()
                //            }
                
                // changed it to this
                // \.1 means take the second val of the tuples returned by enumerated() meaning the emoji text
                // and use that as the ID for each listItem value
                ForEach(Array(foodItems.enumerated()), id: \.1) { index, food in
                    ListItem(emoji: food, counter: $counters[index])
                }
                .padding()
            }
        }
    }
}

struct ListItem: View {
    
    var emoji : String
    
    // we have to ake this binding because
    @Binding var counter : Int
    
    var body: some View {
        HStack {
            Text(emoji)
            Text("Counter: \(counter)")
            Spacer()
            HStack {
                
                Button("+") {
                    counter += 1
                }
                .padding(10)
                .font(.title2)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
                
                Button("-") {
                    counter -= 1
                }
                .padding(10)
                .font(.title2)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
            }
        }
        
    }
}

#Preview {
    ContentView()
}
