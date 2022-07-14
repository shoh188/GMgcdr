//
//  ContentView.swift
//  TEslaUiView
//
//  Created by Shokhrukh Egamov on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var openVoicecommond = true
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack(spacing: 20){
                        HomeHeader()
                        CustomDvider()
                        CorSection()
                        CustomDvider()
                        CategoryView(title: "Quick Shortcuts", showEdit: true, actionItem: quickShortcuts  )
                        CustomDvider()
                        CategoryView(title:"Quick Shortcuts",showEdit: true, actionItem: recentAction)
                        CustomDvider()
                        AllSettings()
                        RouderButton()
                        
                        
                        
                    }
                    .padding()
                }
                
                VoiceCommondButton(open: $openVoicecommond)
                if (openVoicecommond){
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation{
                                openVoicecommond = false
                            }
               
                        }
                    }
                if openVoicecommond{
                    VoiceMessige(open: $openVoicecommond, text: "hello messige")
                        .zIndex(1)
                        .transition(.move(edge:.bottom))
                }
                
            }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color("darkGray"))
           .foregroundColor(Color.white)
           .navigationTitle("Mach Five")
           .navigationBarHidden(true)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VoiceCommondButton : View {
    @Binding var open : Bool
    var body: some View{
        VStack{
            Spacer()
            HStack{
                    Spacer()
                Button(action:{
                    withAnimation{
                        open = true
                    }
                }){
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("green"))
                        .foregroundColor(Color("darkGray"))
                        .clipShape(Circle())
                        .padding()
                        .shadow(radius: 10)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct HomeHeader : View{
    var body: some View{
        HStack{
            
            VStack(alignment: .leading, spacing: 10){
                Image("chevro")
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 127, height: 55)
                
                
                
                Text("Cobalt lt".uppercased())
                    .font(.largeTitle).bold()
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack{
                Button(action:{}){
                    GeneralButton(icon: "lock.fill")
                }
                Button(action:{}){
                    GeneralButton(icon: "gear")
                }
                
                
                
            }
            .padding(.top)        }
    }
}





struct CorSection : View{
    var body: some View{
        VStack{
            HStack(alignment:.center){
                HStack{
                    
                    Image(systemName: "fuelpump")
                    
                    Text("227 km".uppercased())
                }
                .foregroundColor(Color("green"))
                .font(.title3.bold())
                Spacer()
                VStack{
                    Text("Parked")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Last updated: 5 min ago").opacity(0.9)
                        .font(.caption)
                    
                }
            }
            Image("teslaModal")
                .resizable()
            
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct CategoryHeader : View{
    var title : String
    var showEdit : Bool = true
    var body: some View{
        
        HStack(alignment:.center){
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            
            if showEdit {
                Button (action:{}){
                    Text("Edit").opacity(0.6)
                    
                    
                    
                }
                
            }
            
        }
        
    }
    
}

struct CategoryView : View{
    var title : String
    var showEdit: Bool
    var actionItem: [ActionItem]
    var body: some View{
        
        VStack{
            CategoryHeader(title: title, showEdit: showEdit )
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(actionItem, id:\.self){
                        item in ActionButton(item: item)
                        
                    }
                    
                }
            }
        }
    }
}



let quickShortcuts: [ActionItem] = [ActionItem(icon: "bolt.fill", text: "Charging"), ActionItem(icon: "fanblades.fill", text: "Fan On"), ActionItem(icon: "music.note", text: "Media controller "),ActionItem(icon: "bolt.car", text: "Close Charge Port" )]

let recentAction : [ActionItem] = [ActionItem(icon: "wifi", text: "Open Trunk"), ActionItem(icon: "fanblades", text: "Fan Off"), ActionItem(icon: "person.fill.viewfinder", text: "Summon ")]

struct AllSettings: View{
    var body: some View{
        VStack{
            CategoryHeader(title: "All Settings")
            
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]){
                
                NavigationLink(destination:CarController()){
                    
                    SettingBlock(icon: "car.fill", title: "Controls", subTitle: "Interior")
                }
                
                SettingBlock(icon: "fanblades.fill", title: "Climate", subTitle: "Empire 67 F",backgrundColor: Color("blue"))
                NavigationLink(destination: LocationView()){
                SettingBlock(icon: "location.fill", title: "Location", subTitle: "Empire State Bulding")
                }
                SettingBlock(icon: "checkerboard.shield", title: "Securty",subTitle: "0 eventes detector")
                SettingBlock(icon: "sparkles", title: "Upgrades",subTitle: "3 upgrades Avaloble")
            }
        }
    }
}

struct SettingBlock : View{
    var icon : String
    var title : String
    var subTitle : String
    var backgrundColor : Color = Color.white.opacity(0.05)
    
    var body: some View{
        HStack(alignment:.center){
            Image(systemName: icon)
            VStack(alignment: .leading){
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 16 , weight: .medium, design: .default))
                
                
                Text(subTitle.uppercased())
                    .font(.system(size: 8 , weight: .medium, design: .default))
                    .frame(width: .infinity, alignment: .leading)
                    .lineLimit(1)
                
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backgrundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1),
                                                           lineWidth: 0.5))
    }
}

struct RouderButton: View{
    var  body: some View{
        Button(action:{}){
            Text("Roudergraups")
                .font(.caption)
                .padding(.vertical ,8)
                . padding(.horizontal, 14)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
    }
}

