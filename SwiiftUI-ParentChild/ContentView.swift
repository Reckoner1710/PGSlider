//
//  ContentView.swift
//  SwiiftUI-ParentChild
//
//  Created by Puneet Gurtoo on 06/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var homeMenu: Array<HomeMenu> = []
    
    @State var selectedItem: HomeMenu?
    @State private var currentIndex: Int = 0
    @Namespace private var ns

    var body: some View {
        VStack {
            menuList
            Spacer()
            if currentIndex == 0 {
                BookingsView()
                    .background(.green)
            } else if currentIndex == 1 {
                AppointmentView()
                    .background(.red)
            } else {
                ExpenseBookView()
                    .background(.gray)
            }
            Spacer()
        }
    }
    
    var menuList: some View {
        PGSliderView(items: HomeMenu.sample, onItemSelected: { item in
            print(item)
        })
        .padding()
    }
}

#Preview {
    ContentView(homeMenu: HomeMenu.sample)
}
