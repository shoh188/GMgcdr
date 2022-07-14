//
//  ActionCompanenets.swift
//  TEslaUiView
//
//  Created by Shokhrukh Egamov on 14.07.2022.
//

import SwiftUI

struct ActionCompanenets: View {
    var body: some View {
        //        ActionNotifiacrion(open: .constant(true), icon: "fanblades.fill", text: "Turning on the fan")
        //       VoiceMessige(open: .constant(true), text: "Turning on the fan")
        MpPleyr()
    }
}

struct ActionCompanenets_Previews: PreviewProvider {
    static var previews: some View {
        ActionCompanenets()
    }
}

struct ActionNotifiacrion : View{
    @Binding var open: Bool
    var icon : String
    var text : String
    var body: some View{
        VStack{
            Spacer()
            HStack(alignment:.center, spacing: 10){
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                
                Button(action:{}){
                    Text("Cencle")
                        .font(.subheadline)
                        .opacity(0.5)
                    
                    
                }
            }
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color("darkGray"))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        edgesIgnoringSafeArea(.bottom)
    }
}

struct VoiceMessige : View{
    @Binding var open : Bool
    var text : String
    var body: some View{
        VStack(spacing: 0){
            Spacer()
            Image("Mave")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                HStack{
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text(text)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.bottom,15)
                Spacer()
                
                Button(action:{
                    withAnimation{
                        open = false
                    }
                }){
                    Image(systemName: "xmark")
                        .font(.system(size: 24,weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("darkGray"))
                        .foregroundColor(Color.white)
               .clipShape(Circle())
                }
                
                
            }
            .padding()
            .background(Color("green"))
            .foregroundColor(Color("darkGray"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct MpPleyr : View{
    var body: some View{
        VStack {
            Spacer()
            VStack(spacing: 20){
                HStack (alignment:.center){
                    Image("shox")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 8 , style: .continuous))
                    VStack(alignment: .leading, spacing: 5){
                        Text("Shoxrux Rep")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Baxtli bo'l")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .opacity(0.5)
                        
                    }
                    Spacer()
                    
                }
                VStack{
                    HStack{
                        Text("1:43")
                        Spacer()
                        Text("-2:20")
                    }
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .opacity((0.5))
                    
                    ZStack(alignment: .leading){
                        
                        Color.white.opacity(0.25)
                            .frame( height: 6)
                            .clipShape((Capsule()))
                        Color("green")
                            .frame(maxWidth: 200)
                            .frame( height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x : 192)
                    }
                }
                CustomDvider()
                VStack(alignment:.leading){
                    
                    HStack(){
                        
                        Button(action:{}){
                            Image(systemName: "backward.fill")
                                .frame(width: 20)
                                .padding()
                                .font(.title2)
                                .opacity(0.5)
                        }
                        Button(action:{}){
                        Image(systemName: "playpause.fill")
                            .frame(width: 20)
                            .font(.title2)
                        }
                        Button(action:{}){
                        Image(systemName: "forward.fill")
                            .frame(width: 20)
                            .padding()
                            .font(.title2)
                            .opacity(0.5)
                        }
                        Spacer()
                        Button(action:{}){
                        Image(systemName: "minus")
                            .font(.title2)
                            .opacity(0.5)
                        }
                        Button(action:{}){
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title2)
                        }
                        Button(action:{}){
                        Image(systemName: "plus")
                            .font(.title2)
                            .opacity(0.5)
                            
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            .padding()
            .frame( maxWidth: .infinity)
            .background(Color("darkGray"))
            .foregroundColor(Color.white)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
