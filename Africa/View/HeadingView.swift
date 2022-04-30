//
//  HeadingView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: PROPERTIES
    var headingImage:String? = nil
    var headingText:String? = nil 
    
    //MARK: BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage ?? "photo.on.rectangle.angled")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(headingText ?? "Wilderness in Pictures")
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}
//MARK: PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildness pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
