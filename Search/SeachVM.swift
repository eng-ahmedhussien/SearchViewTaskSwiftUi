//
//  SeachVM.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 25/05/2023.
//

import Foundation
import Combine

class SearchVM:ObservableObject{
    @Published var scaneResult: String? = nil
    @Published var searchText: TextFieldData = TextFieldData()
    private var cancellable =  Set<AnyCancellable>()
    
    init(){
        self.ScandDataFun()
    }
    
    func ScandDataFun(){

        $scaneResult
            .sink { returnedData in
                guard let returnedData = returnedData else {
                     return print("failure to  scane iamge \(String(describing: returnedData)) ")
                }
                
                print("sucess scane iamge \(returnedData) ")
            }.store(in: &cancellable)
        
        
        $searchText
            .sink { returnedData in
                print("search text :  \(returnedData.text) ")
            }.store(in: &cancellable)

        
    }
    
    
}
