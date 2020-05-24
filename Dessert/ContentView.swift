//
//  ContentView.swift
//  Dessert
//
//  Created by Al Amin on 20/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var select = 0
    @State private var showView = false
    var body: some View {
        ZStack(alignment: .top) {
            VStack{ // second view
                HStack(alignment: .top, spacing: 15){
                    Image("pic")
                    .resizable()
                    .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Catheine")
                            .fontWeight(.bold)
                        Text("New Your, Us")
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    Button(action: {
                        withAnimation(Animation.default.speed(0.6)) {
                            self.showView.toggle()
                        }
                        
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
            .padding()
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack(spacing: 20){
                        Capsule()
                            .fill(Color.yellow)
                        .frame(width: 5, height: 35)
                        Button(action: {
                            withAnimation(Animation.default.speed(0.6)) {
                                self.showView.toggle()
                            }
                        }) {
                            Text("Home")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    
                    HStack(spacing: 20){
                        Capsule()
                            .fill(Color.yellow)
                        .frame(width: 5, height: 35)
                        Button(action: {
                            
                        }) {
                            Text("Order")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    
                }
            .padding()
                Spacer()
            
            }
            .background(Color.white)
            .offset( x: !self.showView ?  230 : 0, y: 0)
            .scaleEffect(!self.showView ? 0.1 : 1)
            VStack{// first view
                Header(select: $select, showView: $showView)
                
                ScrollView(.vertical, showsIndicators: false) {
                    if self.select == 0 {
                        OneRowView()
                        
                    }else{
                        GirdView()
                        
                    }
                }.padding()
                
                
            }
              
                // .padding()
                .background(Color("Color").edgesIgnoringSafeArea(.bottom))
                
                .offset( x: self.showView ?  230 : 0, y: 0)
                .scaleEffect(self.showView ? 0.8 : 1)
            
            
           
        }
            //.scaleEffect(0.9)
           // .animation(.default)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct row : Identifiable {
    
    var id : Int
    var name : String
    var pic : String
    var likes : String
}

var rowDatas = [
    
    row(id: 0, name: "Matcha Raspberry ", pic: "r11", likes: "190"),
    row(id: 1, name: "Red Velvet", pic: "r12", likes: "98"),
    
    row(id: 2, name: "Cupcakes with Cream and Berries", pic: "r21", likes: "92"),
    row(id: 3, name: "Pistachio Macarons", pic: "r22", likes: "88"),
    
    row(id: 4, name: "Creamy Strawberry Tart", pic: "r31", likes: "32"),
    row(id: 5, name: "Delisious Cheesecake", pic: "r32", likes: "160")
    
]

struct DataTypes : Identifiable {
    
    var id : Int
    var rows : [row]
}

var gridDatas = [
    
    DataTypes(id: 0, rows:
        
        [row(id: 0, name: "Matcha Raspberry", pic: "r11", likes: "190"),row(id: 1, name: "Red Velvet", pic: "r12", likes: "98")]
    ),
    
    DataTypes(id: 1, rows:
        [row(id: 0, name: "Cupcakes with Cream and Berries", pic: "r21", likes: "92"),row(id: 1, name: "Pistachio Macarons", pic: "r22", likes: "88")]
    ),
    
    DataTypes(id: 2, rows: [row(id: 0, name: "Creamy Strawberry Tart", pic: "r31", likes: "32"),row(id: 1, name: "Delisious Cheesecake", pic: "r32", likes: "160")]
    )
    
]

struct Header: View {
    @Binding var select: Int
    @Binding  var showView:Bool
    var body: some View {
                    ZStack{
                HStack{
                    
                    Button(action: {
                        withAnimation(Animation.default.speed(0.6)) {
                            self.showView.toggle()
                        }
                    }) {
                        Image(systemName:"line.horizontal.3")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("search")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                .padding()
                
                HStack(spacing: 25){
                    
                    VStack {
                        Button(action: {
                            self.select = 0
                        }) {
                            Image("row")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.select == 0 ? .red : Color("Color"))
                        }
                        Circle().fill( self.select == 0 ? Color.red : Color.white)
                            .frame(width: 7, height: 7)
                    }.padding(.top, 7)
                    
                    
                    
                    
                    VStack {
                        Button(action: {
                            self.select = 1
                        }) {
                            Image("grid")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.select == 1 ? .red : Color("Color"))
                        }
                        Circle().fill( self.select == 1 ? Color.red : Color.white)
                            .frame(width: 7, height: 7)
                    }.padding(.top, 7)
                }
                
                
            }
                
            .background(Color.white)
           // .scaleEffect(0.7)
        
        
    }
}

struct OneRowView: View {
    var body: some View {
        ForEach(rowDatas){ rowData in
            VStack(spacing: 0){
                Image(rowData.pic)
                    .resizable()
                    .frame(height: 180)
                // .aspectRatio(contentMode: .fit)
                
                HStack {
                    Text(rowData.name)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Spacer()
                    
                    Text(rowData.likes)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("heart")
                            .renderingMode(.original)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 10)
                
            }
            .background(Color.white)
            .cornerRadius(18)
        }
    }
}

struct GirdView: View {
    @State private var height = UIScreen.main.bounds.height
    var body: some View {
        ForEach(gridDatas){ gridData in
            HStack(alignment:.top, spacing: 15){
                ForEach(gridData.rows){ row in
                    VStack(spacing: 15){
                        if self.height > 800 {
                            Image(row.pic)
                                .resizable()
                                .frame(height: 180)
                        }else{
                            Image(row.pic)
                                .resizable()
                                .frame(height: 150)
                        }
                        
                        // .aspectRatio(contentMode: .fit)
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text(row.name)
                                Spacer()
                            }
                            
                            
                            HStack {
                                Spacer()
                                Text(row.likes)
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                    Image("heart")
                                        .renderingMode(.original)
                                }
                            }
                            
                        }
                        .padding(.bottom)
                        .padding(.horizontal, 10)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                }
                
            }
        }
    }
}
