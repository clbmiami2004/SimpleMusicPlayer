//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        //Applying query.
        let query = MPMediaQuery()
        //Predicate is like a filter.
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        //Applying the filter of the Genre of the songs we're getting.
        query.addFilterPredicate(predicate)
        
        //Getting back the genre we chose.
        musicPlayer.setQueue(with: query)
        
        //Shuffle function.
        musicPlayer.shuffleMode = .songs
        
        //Play the songs.
        musicPlayer.play()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
}
