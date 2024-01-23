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
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 20) {
                    ForEach(homeMenu, id: \.self) { item in
                        if item.id == currentIndex {
                            ZStack {
                                Text(item.name)
                                    .bold()
                                VStack() {
                                    Rectangle().frame(height: 2)
                                        .padding(.top, 20)
                                }
                                .matchedGeometryEffect(id: "animation", in: ns)
                            }
                        } else {
                            Text(item.name)
                                .onTapGesture {
                                    withAnimation {
                                        currentIndex = item.id
                                        proxy.scrollTo(item)
                                    }
                                }
                        }
                    }
                }
            }
        }
        //.background(.yellow)
        .padding()
    }
}

#Preview {
    ContentView(homeMenu: HomeMenu.sample)
}

//struct PGSlider<T>: View {
//    
//    @Binding var items: [T]
//    @State private var currentIndex: Int = 0
//    @Namespace private var ns
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            ScrollViewReader { proxy in
//                HStack(spacing: 20) {
//                    ForEach($items, id: \.self) { item in
//                        if item.id == currentIndex {
//                            ZStack {
//                                Text(item.name)
//                                    .bold()
//                                VStack() {
//                                    Rectangle().frame(height: 2)
//                                        .padding(.top, 20)
//                                }
//                                .matchedGeometryEffect(id: "animation", in: ns)
//                            }
//                        } else {
//                            Text(item.name)
//                                .onTapGesture {
//                                    withAnimation {
//                                        currentIndex = item.id
//                                        proxy.scrollTo(item)
//                                    }
//                                }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
