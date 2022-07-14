//
//  LocationView.swift
//  TEslaUiView
//
//  Created by Shokhrukh Egamov on 11.07.2022.
//

import SwiftUI
import MapKit

struct CoreLacation : Identifiable {
    let id = UUID()
    let latituge : Double
    let longitude : Double
    var cordinatin : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: longitude, longitude: longitude)
    }
}

let coreLacation = [CoreLacation(latituge: 41.31057, longitude: 69.28189)]


struct LocationView: View {
    @Environment (\.presentationMode) var presentationModes
    
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.31057, longitude: 69.28189),
                                                     span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    var body: some View {
        ZStack{
            Map(coordinateRegion: $location, annotationItems: coreLacation, annotationContent: { location in
                MapAnnotation(coordinate: location.cordinatin ,
                              content: {CarPin()})
            })
            
            CoreLacationPanel()
            LinearGradient(gradient: Gradient(colors: [Color("darkGray"),Color.clear]), startPoint: .top, endPoint: .bottom)
                .allowsHitTesting(false)
            VStack {
                HStack{
                    Button(action:{
                        presentationModes.wrappedValue.dismiss()
                    }) {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button(action:{}){
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("darkGray"))
        .foregroundColor(Color.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
        
    }
    
}

struct CarPin : View {
    var body: some View{
        VStack(alignment: .center, spacing: 4){
            Image(systemName: "car.circle.fill")
                .frame(width: 32,  height: 32)
                .background(Color("red"))
                .foregroundColor(Color.white)
                .clipShape(Circle())
            Text("match fifve")
                .padding()
                .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 8,style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8,style: .continuous).stroke(Color.black.opacity(0.1),lineWidth: 1))
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct CoreLacationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment:.leading, spacing: 20){
                VStack(alignment:.leading, spacing: 10 ){
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,  alignment: .leading)
                    CustomDvider()
                    Label("Toshkent shahar Amir Temur  ",systemImage: "location.fill")
                        .font(.footnote)
                        .opacity(0.5)
                }
                VStack(alignment: .leading, spacing:10){
                    VStack(alignment: .leading , spacing: 5){
                        Text("Summon")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("prerwew ")
                            .font(.headline)
                            .font(.footnote)
                    }
                    CustomDvider()
                    FullButton(text: "Go to target  ")
                    HStack{
                        FullButton(text: "fowward", icon: "arrow.up")
                        FullButton(text: "fowward", icon: "arrow.down")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("darkGray"))
            .foregroundColor(Color.white)
        }
    }
}
