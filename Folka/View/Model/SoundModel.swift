//
//  SoundModel.swift
//  Meow Hunt
//
//  Created by Ferry Julian on 18/08/22.
//

import Foundation
import AVFoundation

class Sound {
    static let sharedInstance = Sound()
    var condition = true
    private var player: AVAudioPlayer?
    private var playerBack: AVAudioPlayer?
    private var playerButton: AVAudioPlayer?
    
    func playBacksound(file: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: fileExtension) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            playerBack = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = playerBack else { return }

            if(condition){
                player.play()
                player.numberOfLoops = -1
            } else {
                player.stop()
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func play(file: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: fileExtension) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }

            if(condition){
                player.play()
            } else {
                player.stop()
            }

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stop(file: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: fileExtension) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }

            player.stop()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopTalk(){
        player?.stop()
    }

    func stop() {
        playerBack?.pause()
        player?.pause()
    }
    
    func resume(){
        playerBack?.play()
        player?.play()
    }
    
    func playButton(file: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: fileExtension) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            playerButton = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = playerButton else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopButton() {
        playerButton?.stop()
    }
}
