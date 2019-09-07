//
//  SwiftUIImagePicker.swift
//  LegacyUIKitControls-SwiftUI
//
//  Created by Tommie Carter on 9/7/19.
//  Copyright © 2019 MING Technology LLC. All rights reserved.
//

import SwiftUI

struct SwiftUIImagePicker: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        
        VStack{
            
            image?.resizable()
            .scaledToFit()
            
            Button(action: {
                self.showImagePicker = true
            }) {
               Text("Open Camera")
            }.padding()
                .background(Color.red)
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            
            Spacer()
        }
    }
}

struct SwiftUIImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImagePicker()
    }
}
