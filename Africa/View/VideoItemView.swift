//
//  VideoItemView.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import SwiftUI

struct VideoItemView: View {
    //MARK: PROPERTIES
    var video:Video
    //MARK: BODY
    var body: some View {
        HStack(spacing:10){
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
            
        }//: HStack
    }
}

struct VideoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let videos:[Video] = Bundle.main.decode("videos.json")
        VideoItemView(video: videos.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
