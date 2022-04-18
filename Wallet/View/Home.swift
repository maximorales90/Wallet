//
//  Home.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 0) {
                    
                    //MARK: Cards
                    ForEach(cards){card in
                        CardView(card: card)
                    }
                }
            }
            .coordinateSpace(name: "SCROLL")
        }
        .padding([.horizontal,.top])
    }
    
    //MARK: Card View
    @ViewBuilder
    func CardView(card: Card)->some View{
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            
            let offset = -rect.minY + CGFloat(getIndex(Card: card) * 70)
            
            ZStack(alignment: .bottomLeading){
                
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(card.name)
                        .fontWeight(.bold)
                    
                    Text(customizedCardNumber(number: card.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                    
                }
                .padding()
                .padding(.bottom,10)
                .foregroundColor(.white)
            }
            .offset(y: offset)
            
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
    
    //MARK: Index
    func getIndex(Card: Card)->Int{
        return cards.firstIndex{ currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
    
    //MARK: Hiding all number except last four
    func customizedCardNumber(number: String)->String {
        var newValue: String = ""
        let maxCount = number.count - 4
        
        number.enumerated().forEach { value in
            if value.offset >= maxCount{
                let string = String(value.element)
                newValue.append(contentsOf: string)
            }
            else{
                let string = String(value.element)
                if string == " "{
                    newValue.append(contentsOf: " ")
                }
                else{
                    newValue.append(contentsOf: "*")
                }
            }
        }
        return newValue
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}