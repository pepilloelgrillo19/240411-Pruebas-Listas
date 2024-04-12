//
//  RestaurantDetailView.swift
//  SwiftUINavigationList
//
//  Created by Luis on 11/4/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    //Creamos esta variable para que la modificación de la barra de retroceso
    @Environment(\.presentationMode) var mode
    
    var restaurant: Restaurant
    @State var size: CGFloat = 0.5
    var repeatingAnimation: Animation {
            Animation
                .easeInOut(duration: 2) //.easeIn, .easyOut, .linear, etc...
                .repeatForever()
        }
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    /*Text("\(Image(systemName: "heart.fill")) \(restaurant.name)") .foregroundColor(.red)*/
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .scaleEffect(size)
                            .onAppear() {
                                withAnimation(self.repeatingAnimation) { self.size = 1.3 }
                            }
                                Text(restaurant.name)
                                    .foregroundColor(.red)
                            
                    }
        })
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Homei", image: "homei"))
    }
}
