//
//  PhotoCaptureView.swift
//  LegacyUIKitControls-SwiftUI
//
//  Created by Tommie Carter on 9/7/19.
//  Copyright © 2019 MING Technology LLC. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Binding var showImagePicker:Bool
    @Binding var image:Image?
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false),image: .constant(Image("")))
    }
}
