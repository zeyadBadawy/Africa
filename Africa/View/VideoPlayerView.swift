//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: PROPERTIES
    var videoName:String
    var videoTitle:String
    
    //MARK: BODY
    var body: some View {
        ZStack {
            VideoPlayer(player: playVideo(fileName: videoName, fileFormat: "mp4"))
                .navigationTitle(videoName)
            .navigationBarTitleDisplayMode(.inline)
            
            HStack {
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Spacer()
                }
                Spacer()
            }
            
        }//: ZStack
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
         NavigationView {
            VideoPlayerView(videoName: "lion", videoTitle: "lion")
        }
    }
}
