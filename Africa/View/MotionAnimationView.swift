//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK: PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating:Bool = false
    
    
    //MARK: FUNCTIONS
    //1: RANDOM COORDINATE
    func randomCoordinate(max:CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //2: RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    //3: RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //3: RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.25...1.0)
    }
    
    //3: RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //MARK: BODY
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0...randomCircle , id:\.self) { item in
                    Circle()
                        .fill(Color.gray)
                        .opacity(0.15)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    .position(x: randomCoordinate(max: geometry.size.width) , y: randomCoordinate(max: geometry.size.height))
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                    )
                }//: Loop
                .onAppear {
                    isAnimating = true
                }
            }//: ZStack
            .drawingGroup()
        }//: Geometry
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
