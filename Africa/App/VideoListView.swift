//
//  VideoListView.swift
//  Africa
//
//  Created by Zeyad Badawy on 22/04/2022.
//

import SwiftUI

struct VideoListView: View {
    //MARK: PROPERTIES
    @State private var videos:[Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(videos) { item in
                    NavigationLink {
                        VideoPlayerView(videoName: item.id, videoTitle: item.name)
                    } label: {
                        VideoItemView(video: item)
                            .padding(.vertical , 8)
                    }
                }
            }//: List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }//: Button
                }
            }//: Tool bar
        }//: Nav
        
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            VideoListView()
        }
    }
}
