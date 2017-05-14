//
//  VideoModel.swift
//  YouTubeApp
//
//  Created by Chris Rowlands on 19/04/2017.
//  Copyright © 2017 com.yellowlemon. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
    // Function getVideos returns an array of Video objects
    func getVideos() -> [Video] {
        
        //VIDEO 1
        
        // Videos is equal to empty videos array
        // Create an empty array of video objects
        var videos = [Video]()
        
        // Create a video object 
        let video1 = Video() // New instance of Video class
        
        // Assign properties 
        video1.videoId = "wknekg7IeTU"
        video1.videTitle = "Preparing a 2009 MacBook for macOS Sierra"
        video1.videoDescription = "I spent less than $200 on a Late 2009 MacBook, the oldest laptop that is supported by macOS Sierra. I show how to install an SSD and additional RAM for the best possible performance out of the notebook."
        
        // Append it into the videos array
        videos.append(video1)
        
        //VIDEO 2
        
        let video2 = Video()
        video2.videoId = "mX9g2Uv3iY0"
        video2.videTitle = "Living Large with the 17-inch PowerBook and MacBook Pro"
        video2.videoDescription = "The 17-inch PowerBooks and MacBook Pros are big, heavy slabs of Mac history. They may be gone, but they left their mark on Apple's notebooks in a very real way."
        videos.append(video2)
        
        //VIDEO 3
        
        let video3 = Video()
        video3.videoId = "UDDQ6Wukj0c"
        video3.videTitle = "Unboxing Apple's Ugliest Mac"
        video3.videoDescription = "I bought a Power Mac G3 All-in-One. THE MOLAR MAC."
        videos.append(video3)
        
        //VIDEO 4
        
        let video4 = Video()
        video4.videoId = "x5c58ZNNtqk"
        video4.videTitle = "The 20th Anniversary Mac"
        video4.videoDescription = "The 20th Anniversary Mac was meant to mark to celebrate two decades of Apple. It's an unusual computer that didn't sell very well, but pointed the way to the future in a unique way."
        videos.append(video4)
        
        
        
        
        
        // Return the array to the caller
        return videos
    }

}
