//
//  SongVC.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 25.04.2023.
//

import UIKit
import AVFoundation

class SongVC: UIViewController {
    //MARK: - Properties
    
    var player: AVAudioPlayer!
    
    private let songImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "flowers")
        return iv
    }()
    
    private let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderChanged), for: .touchDragInside)
        return slider
    }()
    
    lazy private var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy private var playForwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        return button
    }()
    
    lazy private var playBackwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        return button
    }()
    
    lazy private var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        return button
    }()
    
    private var songNameAndArtist: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        let attributedText = NSMutableAttributedString(string: "Flowers\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSAttributedString(string: "Miley Cyrus", attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.gray]))
        label.attributedText = attributedText
        return label
    }()

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        let url = Bundle.main.url(forResource: "miley-cyrus-flowers", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .lightGray
        
        view.addSubview(songImage)
        songImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        songImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        songImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        songImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(slider)
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 100).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        
        view.addSubview(playButton)
        playButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 8).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(playBackwardButton)
        playBackwardButton.rightAnchor.constraint(equalTo: playButton.leftAnchor, constant: -16).isActive = true
        playBackwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        
        view.addSubview(playForwardButton)
        playForwardButton.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 16).isActive = true
        playForwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        
        view.addSubview(optionsButton)
        
        view.addSubview(songNameAndArtist)
//        songNameAndArtist.widthAnchor.constraint(equalToConstant: 200).isActive = true
        songNameAndArtist.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 32).isActive = true
        songNameAndArtist.leftAnchor.constraint(equalTo: slider.leftAnchor, constant: 0).isActive = true
        
        view.addSubview(optionsButton)
        optionsButton.rightAnchor.constraint(equalTo: slider.rightAnchor, constant: 0).isActive = true
        optionsButton.centerYAnchor.constraint(equalTo: songNameAndArtist.centerYAnchor).isActive = true
    }
    
    //MARK: - Selectors
    
    @objc func playButtonPressed() {
        if player.isPlaying {
            player.stop()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
//            UIView.animate(withDuration: 0.2) {            ANIMATE
//                self.songImage.frame = CGRect(x: 20,
//                                              y: 20,
//                                              width: self.slider.frame.width - 60,
//                                              height: self.slider.frame.width - 60)
//            }
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            slider.maximumValue = Float(player.duration)
        }
    }
    
    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
    }
    
    @objc func sliderChanged() {
        player.stop()
        player.currentTime = TimeInterval(slider.value)
        player.prepareToPlay()
        player.play()
    }
}
