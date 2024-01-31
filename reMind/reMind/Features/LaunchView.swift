//
//  LaunchView.swift
//  reMind
//
//  Created by Marcelo De Araújo on 31/01/24.
//

import SwiftUI

struct LaunchScreenView: View {

    @State private var rodarRetangulo = false
    @State private var tilt = false
    @State private var fecharRetangulo = false
    @State private var zeroOpaco = false
    @State private var novoRetangulo = false
    @State private var showBoxesView = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Text("reMind")
                        .font(.system(size: 100))
                        .rotation3DEffect(Angle(degrees: tilt ? 0 : -90), axis: (x: 1, y: 0, z: 0))
                        .animation(.linear(duration: 1), value: tilt)
                        .opacity(zeroOpaco ? 0 : 1)
                        .animation(.easeOut(duration: 0.5).delay(1.2), value: zeroOpaco)

                    Rectangle()
                        .stroke(.red, lineWidth: 10)
                        .frame(width: 200, height: 200)
                        .rotationEffect(Angle(degrees: rodarRetangulo ? 90 : 0))
                        .animation(.linear(duration: 1), value: rodarRetangulo)
                        .scaleEffect(novoRetangulo ? 1 : 0)
                        .animation(.default.delay(1.4), value: novoRetangulo)

                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .overlay(generateRandomGradient())
                        .scaleEffect(novoRetangulo ? 1 : 0)
                        .animation(.default.delay(1.4), value: novoRetangulo)
                }
                .onAppear() {
                    rodarRetangulo = true
                    tilt = true
                    fecharRetangulo = true
                    zeroOpaco = true
                    novoRetangulo = true
                }
                .background(
                    NavigationLink(
                        "",
                        destination: BoxesView(viewModel: BoxViewModel()),
                        isActive: $showBoxesView
                    )
                    .hidden()
                )
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                        showBoxesView = true
                    }
                }
            }
        }
    }
    func generateRandomGradient() -> some View {
        let randomGradient = GradientGenerator.randomGradient()
        return randomGradient
                .ignoresSafeArea(.all)
    }
}

#Preview {
    LaunchScreenView()
}
