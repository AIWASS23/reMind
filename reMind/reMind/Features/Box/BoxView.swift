//
//  BoxView.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import SwiftUI

struct BoxView: View {
    @ObservedObject var viewModel: BoxModel
    
    @State private var isCreatingTerm: Bool = false
    
    var body: some View {
        List {
            TodaysCardsView(
                numberOfPendingCards: viewModel.getNumberOfPendingTerms(),
                theme: .mauve
            )
            Section {
                ForEach(viewModel.filteredTerms, id: \.self) { term in
                    Text(term.value ?? "Unknown")
                        .padding(.vertical, 8)
                        .fontWeight(.bold)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.deleteTerm(term: term)
                            } label: {
                                Image(systemName: "trash")
                            }

                        }
                }
            } header: {
                Text("All Cards")
                    .textCase(.none)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Palette.label.render)
                    .padding(.leading, -16)
                    .padding(.bottom, 16)
            }

        }
        .scrollContentBackground(.hidden)
        .background(reBackground())
        .navigationTitle(viewModel.box.name ?? "Unknown")
        .searchable(text: $viewModel.searchText, prompt: "")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    print("edit")
                } label: {
                    Image(systemName: "square.and.pencil")
                }

                Button {
                    isCreatingTerm.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isCreatingTerm) {
            TermEditorView(box: $viewModel.box, isPresented: $isCreatingTerm)
                .onDisappear {
                    viewModel.updateFilteredTerms()
                }
        }
    }
}

struct BoxView_Previews: PreviewProvider {
    static let box: Box = {
        let box = Box(context: CoreDataStack.inMemory.managedContext)
        box.name = "Box 1"
        box.rawTheme = 0
        BoxView_Previews.terms.forEach { term in
            box.addToTerms(term)
        }
        return box
    }()

    static let terms: [Term] = {
        let term1 = Term(context: CoreDataStack.inMemory.managedContext)
        term1.value = "Term 1"

        let term2 = Term(context: CoreDataStack.inMemory.managedContext)
        term2.value = "Term 2"

        let term3 = Term(context: CoreDataStack.inMemory.managedContext)
        term3.value = "Term 3"

        return [term1, term2, term3]
    }()
    

    static var previews: some View {
        NavigationStack {
            BoxView(viewModel: .init(box: Box()))
        }
    }
}
