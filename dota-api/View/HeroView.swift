//
//  HeroView.swift
//  dota-api
//
//  Created by Candra Winardi on 24/11/22.
//

import SwiftUI

struct HeroView: View {
    @ObservedObject var api = ApiService()
    @ObservedObject var vm = HeroViewModel()
    @State private var showingSheet = false
    @State private var selectedItem = 0
    @State var filter: String
    @State var sort: String
    @State private var heroRoles = ["All", "Carry", "Disabler", "Durable", "Escape", "Initiator", "Jungler", "Nuker", "Pusher", "Support"]
    @State private var sortList = ["Base Attack (Lower Limit)", "Base Health", "Base Mana", "Base Speed"]
    
    let columns = [
        GridItem(.adaptive(minimum: 100), alignment: .top),
        GridItem(.adaptive(minimum: 100), alignment: .top),
        GridItem(.adaptive(minimum: 100), alignment: .top)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(heroRoles, id: \.self){ role in
                            Button {
                                filter = role
                            } label: {
                                Text(role)
                                    .padding()
                                    .frame(height: 35)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    
                }
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(vm.filterAndSortHeros(filter: filter, sort: sort, heros: api.heros), id:\.self){ hero in
                            NavigationLink {
                                DetailHeroView(hero: hero)
                            } label: {
                                VStack{
                                    URLImage(urlString: image_url + hero.img)
                                        .frame(width:130, height: 70)
                                    Text(hero.localizedName)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Dota")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                api.fetch()
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack{
                        Button {} label: { Text("").hidden() }
                        
                        Spacer()
                        
                        Button {
                            showingSheet.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                        }

                    }
                    

                }
            }
            .sheet(isPresented: $showingSheet) {
                NavigationView{
                    List{
                        ForEach(sortList, id: \.self){ sorts in
                            Button {
                                sort = sorts
                                showingSheet = false
                            } label: {
                                Text(sorts)
                            }.foregroundColor(.black)
                        }
                    }.navigationTitle("Sort Heroes")
                        .navigationBarTitleDisplayMode(.inline)
                        .listStyle(.grouped)
                        .toolbar{
                            Button ("Apply"){
                                showingSheet = false
                            }
                        }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(filter: "All", sort: "Base Health")
    }
}
