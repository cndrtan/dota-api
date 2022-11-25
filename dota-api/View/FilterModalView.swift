//
//  FilterModalView.swift
//  dota-api
//
//  Created by Candra Winardi on 25/11/22.
//

import SwiftUI

struct FilterModalView: View {
    @Environment(\.presentationMode) var pm
    @State var sort = ""
    var body: some View {
        NavigationView {
            List{
                Button {
                    sort = "Attack"
                    pm.wrappedValue.dismiss()
                } label: {
                    Text("Base Attack (Lower Limit)")
                }.foregroundColor(.black)

                Button {
                    
                } label: {
                    Text("Base Health")
                }.foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Text("Base Mana")
                }.foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Text("Base Speed")
                }.foregroundColor(.black)
            }.navigationTitle("Sort Heroes")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.grouped)
                .toolbar{
                    Button ("Apply"){
                        pm.wrappedValue.dismiss()
                    }
                }
        }
        
    }
}

struct FilterModalView_Previews: PreviewProvider {
    static var previews: some View {
        FilterModalView()
    }
}
