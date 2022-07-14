//
//  CarController.swift
//  TEslaUiView
//
//  Created by Shokhrukh Egamov on 10.07.2022.
//

import SwiftUI
let carContollers : [ActionItem] = [
    ActionItem(icon: "flashlight.on.fill", text: "Flash"),
    ActionItem(icon: "speaker.wave.3.fill", text: "Honk"),
    ActionItem(icon: "key.fill", text: "Start"),
    ActionItem(icon: "arrow.up.bin", text: "Front"),
    ActionItem(icon: "arrow.up.square", text: "Trunk")
]
struct CarController: View {
    
    @Environment(\.presentationMode) var presentationModes
    
    @State private var valletMode : Bool = false
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20){
                
                VStack(alignment:.leading, spacing: 10){
                    
                    HStack{
                        Button(action:{
                            presentationModes.wrappedValue.dismiss()
                        }){
                            GeneralButton(icon: "chevron.left")
                            
                        }
                        Spacer()
                        
                    }
                    
                    Text("Car controlles")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                CustomDvider()
                CarLockButton()
                CustomDvider()
                CarcontrollerAction()
                CustomDvider()
                HStack{
                    Text("Valet Mode")
                    Toggle("" , isOn: $valletMode).tint(.gray.opacity(0.8))
                }
                if
                    valletMode{
                    Text("Vallet mode is on !")
                }
            }
            
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("darkGray"))
        .foregroundColor(Color.white)
        .navigationBarTitle("Mach Five")
        .navigationBarHidden(true)
        
        
    }
    
    
}

struct CarController_Previews: PreviewProvider {
    static var previews: some View {
        CarController()
    }
}
struct CarLockButton: View {
    var body: some View {
        Button(action:{}){
       FullButton(text: "Unlock", icon: "unlock.fill")
        }
    }
}

struct CarcontrollerAction: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Spacer()
                ActionButton(item: carContollers[0])
                Spacer()
                ActionButton(item: carContollers[1])
                Spacer()
                ActionButton(item: carContollers[2])
                Spacer()
            }
            HStack{
                Spacer()
                ActionButton(item: carContollers[3])
                Spacer()
                ActionButton(item: carContollers[4])
                Spacer()
                
            }
            
        }
        .padding()
    }
}


