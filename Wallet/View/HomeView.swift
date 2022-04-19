//
//  Home.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

struct HomeView: View {
    //MARK: Animation Properties
    @State var expandCards: Bool = false
    
    //MARK: Detail View Properties
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    
    
    var body: some View {
        
        VStack(spacing: 0){
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: expandCards ? .leading : .center)
                .overlay(alignment: .trailing){
                    //MARK: Close Button
                    Button {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)){
                            expandCards = false
                        }
                        
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
                    }
                    .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                    .offset(x: expandCards ? 10 : 15)
                    .opacity(expandCards ? 1 : 0)
                }
                .padding(.horizontal,15)
                .padding(.bottom,10)
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 0) {
                    
                    //MARK: Cards
                    ForEach(cards){card in
                        
                        Group{
                            CardView(card: card)
                                .matchedGeometryEffect(id: card.id, in: animation)
                        }
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)){
                                    currentCard = card
                                    showDetailCard = true
                                }
                            }
                    }
                }
                .overlay{
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture{
                            withAnimation(.easeInOut(duration: 0.35)){
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
        }
        .padding([.horizontal,.top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay{
            if let currentCard = currentCard,showDetailCard {
                DetailView(currentCard: currentCard, showDetailCard: $showDetailCard, animation: animation)
            }
        }
               
    }
    
    //MARK: Card View
    @ViewBuilder
    func CardView(card: Card)->some View{
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))
            
            ZStack(alignment: .bottomLeading){
                
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
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
            .offset(y: expandCards ? offset : -rect.minY + offset)
            
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
}

//MARK: Global Hiding all number except last four
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
