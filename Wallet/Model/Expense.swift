//
//  Expense.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

// MARK: Expense Model

struct Expense: Identifiable {
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}


// MARK: Sample Data

var expenses: [Expense] = [

    Expense(amountSpent: "$130", product: "Dribbble", productIcon: "icon1", spendType: "Membresía"),
    Expense(amountSpent: "$111", product: "Disney", productIcon: "icon2", spendType: "Streaming"),
    Expense(amountSpent: "$130", product: "Ayana Mart", productIcon: "icon3", spendType: "Comestibles"),
    Expense(amountSpent: "$230", product: "Huawei", productIcon: "icon4", spendType: "Celular P50 Pro"),
    Expense(amountSpent: "$110", product: "House Remt", productIcon: "icon5", spendType: "Familia"),
    Expense(amountSpent: "$12", product: "Amazon Prime", productIcon: "icon6", spendType: "Películas"),
    Expense(amountSpent: "$9", product: "Netflix", productIcon: "icon7", spendType: "Películas"),
    Expense(amountSpent: "$1399", product: "HP", productIcon: "icon8", spendType: "Notebook"),
    Expense(amountSpent: "$5", product: "Duolingo", productIcon: "icon9", spendType: "Membresía"),
    Expense(amountSpent: "$69", product: "Figma", productIcon: "icon10", spendType: "Membresía"),
    Expense(amountSpent: "$80", product: "Airbnb", productIcon: "icon11", spendType: "Turismo"),
    Expense(amountSpent: "$10", product: "Soudagor", productIcon: "icon12", spendType: "Alimentos"),
    Expense(amountSpent: "$4299", product: "Apple", productIcon: "icon13", spendType: "MacBook Pro"),
    Expense(amountSpent: "$1399", product: "Apple", productIcon: "icon13", spendType: "iPhone 13 Pro Max"),
    Expense(amountSpent: "$21", product: "Facebook", productIcon: "icon14", spendType: "Publicidad"),
]
