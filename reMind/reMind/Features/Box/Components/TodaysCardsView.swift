//
//  TodaysCardsView.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//


import SwiftUI

struct TodaysCardsView: View {
    @State var numberOfPendingCards: Int
    @State var theme: reTheme
    @State private var isSwippingActive = false // Adicione essa variável de estado

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Today's Cards")
                .font(.title)
                .fontWeight(.semibold)
            Text("\(numberOfPendingCards) cards to review")
                .font(.title3)

            NavigationLink(destination: SwipperView(review: SwipeReview(termsToReview: [])), isActive: $isSwippingActive) {
                EmptyView()
            }
            .hidden()

            Button(action: {
                isSwippingActive.toggle() // Ativa a navegação para SwipperView
                numberOfPendingCards += 1
            }, label: {
                Text("Start Swiping")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(reColorButtonStyle(.mauve))
            .padding(.top, 10)
        }
        .padding(.vertical, 16)
    }
}
