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

struct FoodItem: Identifiable {
    let id = UUID()
    let emoji: String
    var count: Int
}

struct MainStack: View {
    
    // uses a nice struct instead of two separate arrays defined in this view
    @State private var foodItems: [FoodItem] = [
        FoodItem(emoji: "🍕", count: 0),
        FoodItem(emoji: "🍔", count: 0),
        FoodItem(emoji: "🍪", count: 0),
        FoodItem(emoji: "🍉", count: 0),
        FoodItem(emoji: "🍗", count: 0)
    ]
    
    var body: some View {
        VStack {
            Text("Order Food by Emoji")
                .font(.largeTitle)
                .bold()
                .padding(.top)
                .multilineTextAlignment(.center) // make the title centered
            List {
                ForEach($foodItems) { $item in
                    ListItem(emoji: item.emoji, counter: $item.count)
                }
                //.padding()
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
                .buttonStyle(.plain)
                .padding(10)
                .font(.title2)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
                
                Button("-") {
                    counter -= 1
                }
                .buttonStyle(.plain) 
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
