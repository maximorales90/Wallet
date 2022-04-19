//
//  ExpenseCardView.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

struct ExpenseCardView: View {
    var expense: Expense
    
    //Displaying Expenses one by one Based on Index
    @State var showView: Bool = false
    
    var body: some View {
        HStack(spacing: 14){
            Image(expense.productIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 8){
                
                Text(expense.product)
                    .fontWeight(.bold)
                
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8){
                
                Text(expense.amountSpent)
                    .fontWeight(.bold)
                
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .opacity(showView ? 1 : 0)
        .onAppear{
            //Timer for Show Expense
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration:0.3).delay(Double(getIndex()) * 0.1)){
                    showView = true
                }
            }
            
        }
    }
    
    func getIndex()->Int{
        return expenses.firstIndex{ currentExpense in
            return expense.id == currentExpense.id
        } ?? 0
    }
}



//struct ExpenseCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseCardView()
//    }
//}
