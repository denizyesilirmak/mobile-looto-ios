//
//  DrawsCarouselViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 17.11.2023.
//

import Foundation

class DrawsCarouselViewModel: ObservableObject {
    
    @Published var draws: [DrawModel] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getRecentDraws() async {
        print("DrawsCarouselViewModel - getRecentDraws")
        guard let data = try? await APIService().fetchRecentDraws() else {
            self.draws = []
            self.hasError = true
            self.errorMessage = "Server Error/getRecentDraws"
            return
        }
        
        self.draws = data.draws
    }
}
