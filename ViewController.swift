//
//  ViewController.swift
//  YouTubeApp
//
//  Created by Chris Rowlands on 19/04/2017.
//  Copyright © 2017 com.yellowlemon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = [Video]()
    var selectedVideo:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let model = VideoModel()
        self.videos = model.getVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Calculate width of screen to calculate height of row
        return (self.view.frame.width /  320) * 180
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        let videoTitle = videos[indexPath.row].videTitle
        
        // Get the label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        // Customize the cell to display video title
        //cell.textLabel?.text = videoTitle
        
        // Construct video thumbnail URL
        let videoThumbnailUrlString = "https://i1.ytimg.com/vi/" + videos[indexPath.row].videoId + "/maxresdefault.jpg"
        
        //Create NSURL object
        let videoThumbnailUrl = NSURL(string: videoThumbnailUrlString)
        
        if videoThumbnailUrl != nil {
        
        // Create an NSURLRequest object
        let request = URLRequest(url: videoThumbnailUrl! as URL)
        
        // Create an NSURLSession
        let session = URLSession.shared
        
        // Create a datatask and pass it in the request
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {(data:Data?,response:URLResponse?,error:Error?)in
            
                DispatchQueue.main.async {
                    // Get a refrence to the imageview element of the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    // Create an image object from the data and assign it into the imageView
                    imageView.image = UIImage(data: data!)
                }
                
            })
            
            dataTask.resume()
        
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Take note of which video the user selected
        self.selectedVideo = self.videos[indexPath.row]
        
        // Call the segue
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get a refrence to destination view controller
        let detailViewController = segue.destination as! VideoDetailViewController
        // Set the selected video property of the destination view controller
        detailViewController.selectedVideo = self.selectedVideo
    }


}

