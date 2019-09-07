//
//  ImagePicker.swift
//  LegacyUIKitControls-SwiftUI
//
//  Created by Tommie Carter on 9/7/19.
//  Copyright © 2019 MING Technology LLC. All rights reserved.
//

import Foundation
import SwiftUI


class ImagePickerCoordinator:NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isShown: Bool
    @Binding var image: Image?

    init(isShown:Binding<Bool>, image:Binding<Image?>){
        _isShown = isShown
        _image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        image = Image(uiImage:uiImage)
        isShown = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
struct ImagePicker: UIViewControllerRepresentable{
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate  = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
