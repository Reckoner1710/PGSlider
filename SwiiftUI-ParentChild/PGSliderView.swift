//
//  PGSliderView.swift
//  SwiiftUI-ParentChild
//
//  Created by Puneet Gurtoo on 26/01/24.
//

import Foundation
import SwiftUI

protocol PGSliderProtocol: Hashable, Identifiable {
    var id: Int {get}
    var name: String {get}
    var icon: String {get}
    var selected: Bool {get}
}

struct PGSliderView<T: PGSliderProtocol>: View {
    
    var items: [T]
    var onItemSelected: ((T)->Void)?
    @State var currentIndex: Int = 0
    @Namespace private var ns

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 20) {
                    ForEach(items, id: \.self) { item in
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
                                        onItemSelected?(item)
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}
