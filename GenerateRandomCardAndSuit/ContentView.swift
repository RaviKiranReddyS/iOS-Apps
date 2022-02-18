//
//  ContentView.swift
//  GenerateRandomCardAndSuit
//
//  Created by Ravi Kiran Reddy on 2/16/22.
//

import SwiftUI

struct Card
{
    var number = 1
    var suit = 0
}

struct ContentView: View {
    @State var deck = [Card]()
    @State var generatedCardSuits = [String]()
    @State var message = ""
    var suits = ["Spades","Clubs","Hearts","Diamond"]
    
    var body: some View {
        VStack{
            Text(message)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.bottom)
            
            HStack{
                Button("Add Card"){
                    addCard()
                }
                .padding(.trailing)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Button("Draw a Card"){
                    drawCard()
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    // function to add a random card and suit to the deck and display the message accordingly
    func addCard()
    {
        var randomCard = ""
        var generatedCardSuitLog = ""
        
        var addCard = Card()
        addCard.number = Int.random(in: 1...13)
        addCard.suit = Int.random(in: 0...3)
        
        randomCard = getCardName(cardNumber: addCard.number)
        generatedCardSuitLog = randomCard + "/" + String(addCard.suit)
        
        if(generatedCardSuits.contains(generatedCardSuitLog))
        {
            message = "Generated duplicate card."
        }
        else
        {
            deck.append(addCard)
            generatedCardSuits.append(generatedCardSuitLog)
            message = "Generated a " + randomCard + " of " + suits[addCard.suit]
        }
    }
    
    // function to draw a random element from deck and display the message with card and suit that was drawn.
    func drawCard()
    {
        if(deck.count == 0)
        {
            message = "No cards in the deck."
            return
        }
        
        let randomNumber = Int.random(in: 0...deck.count-1)
        let randomCard = deck[randomNumber]
        deck.remove(at: randomNumber)
        
        message = "Drew a " + getCardName(cardNumber: randomCard.number) + " of " + suits[randomCard.suit]
    }

    func getCardName(cardNumber:Int) -> String
    {
        switch cardNumber
        {
            case 1: return "ACE"
            case 2: return "TWO"
            case 3: return "THREE"
            case 4: return "FOUR"
            case 5: return "FIVE"
            case 6: return "SIX"
            case 7: return "SEVEN"
            case 8: return "EIGHT"
            case 9: return "NINE"
            case 10: return "TEN"
            case 11: return "JACK"
            case 12: return "QUEEN"
            case 13: return "KING"
            default: return "INVALID CARD"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
