//
//  SearchView.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 25/05/2023.
//

import SwiftUI
import CodeScanner

struct SearchView: View {
    @StateObject var searchVM :SearchVM
    @State private var isPresentingScanner = false
    
    init() {
        _searchVM = StateObject(wrappedValue: SearchVM())
    }
    
    var body: some View {
        
            AppTextField(data: $searchVM.searchText, placeholderText: "What are you looking for?", leadingView: {Image("search")}, trailingView: {
                NavigationLink {
                    
                    CodeScanView(scaneResult: $searchVM.scaneResult)
                } label: {
                    Image("barcode")
                }
            })
            .padding(.vertical)
            .padding(.horizontal,20)
            .appFont(.headline)
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


