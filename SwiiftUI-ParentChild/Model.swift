//
//  Model.swift
//  SwiiftUI-ParentChild
//
//  Created by Puneet Gurtoo on 06/01/24.
//

import Foundation

struct HomeMenu: PGSliderProtocol {
    var id: Int
    var name: String
    var icon: String
    var selected: Bool
    
    init(id: Int, name: String, icon: String, selected: Bool) {
        self.id = id
        self.name = name
        self.icon = icon
        self.selected = selected
    }
}

extension HomeMenu {
    static var sample: [HomeMenu] = [HomeMenu(id: 0, name: "BOOKINGS",
                                              icon: "watch",
                                              selected: true),
                                     
                                     HomeMenu(id: 1, name: "APPOINTMENT SQUARE",
                                              icon: "options",
                                              selected: false),
                                     
                                     HomeMenu(id: 2, name: "EXPENSE BOOK",
                                              icon: "calculator",
                                              selected: false),
                                     
                                     HomeMenu(id: 3, name: "TAKE MONEY(CREDIT) QUICKBILL PRO",
                                              icon: "credit",
                                              selected: false),
                                     
                                     HomeMenu(id: 4, name: "GIVE MONEY(DEBIT) PAY OUT",
                                              icon: "card",
                                              selected: false),
                                     
                                     HomeMenu(id: 5, name: "ACCOUNT",
                                              icon: "man",
                                              selected: false)]
}
