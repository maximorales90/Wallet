//
//  DetailView.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

struct DetailView: View {
 
    var currentCard: Card
    @Binding var showDetailCard: Bool
    
    //Matched Geometry Effect
    var animation: Namespace.ID
    
    //Delay Expenses View
    @State var showExpensesView: Bool = false
    
    var body: some View {
        VStack{
            CardView()
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture{
                    withAnimation(.easeInOut){
                        showExpensesView = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeInOut(duration: 0.35)){
                               showDetailCard = false
                            }
                    }
                }
                .zIndex(10)
            
            GeometryReader{proxy in
                let height = proxy.size.height + 50
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
                        
                        ForEach(expenses){expense in
                            ExpenseCardView(expense: expense)
                        }
                        
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .ignoresSafeArea()
                )
                .offset(y: showExpensesView ? 0 : height)
                
            }

            .padding([.horizontal, .top])
            .zIndex(-10)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("ColorBG").ignoresSafeArea())
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)){
                showExpensesView = true
            }
        }
    }
    
    //MARK: Card View
     @ViewBuilder
    func CardView()->some View{
        
        ZStack(alignment: .bottomLeading){
            
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 10){
                
                Text(currentCard.name)
                    .fontWeight(.bold)
                
                Text(customizedCardNumber(number: currentCard.cardNumber))
                    .font(.callout)
                    .fontWeight(.bold)
                
            }
            .padding()
            .padding(.bottom,10)
            .foregroundColor(.white)
        }
    }
}



    
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
