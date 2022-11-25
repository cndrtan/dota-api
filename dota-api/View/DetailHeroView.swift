//
//  DetailHeroView.swift
//  dota-api
//
//  Created by Candra Winardi on 25/11/22.
//

import SwiftUI

struct DetailHeroView: View {
    var hero: heroModel
    
    var body: some View {
        List{
            Section{
                URLImage(urlString: image_url + hero.img)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Section{
                HStack{
                    URLImage(urlString: image_url + hero.img)
                        .frame(width: 120, height: 70)
                    VStack(alignment: .leading){
                        Text(hero.localizedName)
                        Text(hero.primaryAttr)
                            .textCase(.uppercase)
                    }
                    Spacer()
                }
            }
            
            Section{
                HStack{
                    Text("Attack Type")
                    Spacer()
                    Text(hero.attackType)
                }
            }
            
            Section{
                HStack{
                    Image(systemName: "cross.fill")
                    Text("Base Health")
                    Spacer()
                    Text("\(hero.baseHealth)")
                }
                HStack{
                    Image("mana")
                        .resizable()
                        .frame(width: 19, height: 19)
                    Text("Base Mana")
                    Spacer()
                    Text("\(hero.baseMana)")
                }
                HStack{
                    Image("shield")
                        .resizable()
                        .frame(width: 19, height: 19)
                    Text("Base Armor")
                    Spacer()
                    Text("\(String(format: "%.1f", hero.baseArmor))")
                }
                HStack{
                    Image("battle")
                        .resizable()
                        .frame(width: 19, height: 19)
                    Text("Base Attack")
                    Spacer()
                    Text("\(hero.baseAttackMin) - \(hero.baseAttackMax)")
                }
            }
            
            Section{
                HStack{
                    Image("shoes")
                        .resizable()
                        .frame(width: 19, height: 19)
                    Text("Base Move")
                    Spacer()
                    Text("\(hero.moveSpeed)")
                }
            }
            
            ForEach(hero.roles, id:\.self){ role in
                HStack{
                    Text("\(role)")
                    Spacer()
                }
            }
            
        }
        .navigationTitle(hero.localizedName)
        .listStyle(.grouped)
        
    }
}

struct DetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(filter: "All", sort: "Base Health")
    }
}
