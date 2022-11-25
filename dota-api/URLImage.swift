//
//  URLImage.swift
//  dota-api
//
//  Created by Candra Winardi on 25/11/22.
//

import Foundation
import SwiftUI

struct URLImage: View{
    let urlString: String

    @State var data: Data?

    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .background(Color.gray)
        }
        else{
            ProgressView()
                .onAppear{
                    fetchData()
                }
        }
    }

    private func fetchData() {
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
