//
//  SongVC.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 25.04.2023.
//

import UIKit
import AVFoundation
import MediaPlayer

private var isSongPaused = false

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
        button.setLargeSize(image: "pause.fill", size: 30)
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy private var playForwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "forward.fill", size: 30)
        button.tintColor = .white
        return button
    }()
    
    lazy private var playBackwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "backward.fill", size: 30)
        button.tintColor = .white
        return button
    }()
    
    lazy private var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "ellipsis.circle", size: 25)
        button.tintColor = .white
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
    
    lazy private var captionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "quote.bubble", size: 20)
        button.tintColor = .white
        return button
    }()
    
    lazy private var airPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "airplayaudio", size: 20)
        button.tintColor = .white
        return button
    }()
    
    lazy private var modeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "text.line.first.and.arrowtriangle.forward", size: 20)
        button.tintColor = .white
        return button
    }()
    
    lazy private var decreaseVolume: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "speaker.fill", size: 15)
        button.tintColor = .white
        return button
    }()
    
    lazy private var increaseVolume: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setLargeSize(image: "speaker.wave.3.fill", size: 15)
        button.tintColor = .white
        return button
    }()
    
    private let swipeLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 6).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let volumeSlider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        
        view.heightAnchor.constraint(equalToConstant: 6).isActive = true
        view.widthAnchor.constraint(equalToConstant: 250).isActive = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        let url = Bundle.main.url(forResource: "miley-cyrus-flowers", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        player.play()
        slider.maximumValue = Float(player.duration)

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        

        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .darkGray
        tabBarController?.tabBar.isHidden = true
        
        view.addSubview(swipeLine)
        swipeLine.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        swipeLine.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(songImage)
        songImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        songImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        songImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        songImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(slider)
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 150).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        
        view.addSubview(songNameAndArtist)
        songNameAndArtist.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 82).isActive = true
        songNameAndArtist.leftAnchor.constraint(equalTo: slider.leftAnchor, constant: 0).isActive = true
        
        let playStack = UIStackView(arrangedSubviews: [playBackwardButton, playButton, playForwardButton])
        playStack.translatesAutoresizingMaskIntoConstraints = false
        playStack.axis = .horizontal
        playStack.distribution = .equalSpacing
        
        view.addSubview(playStack)
        NSLayoutConstraint.activate([
            playStack.heightAnchor.constraint(equalToConstant: 60),
            playStack.leftAnchor.constraint(equalTo: slider.leftAnchor, constant: 40),
            playStack.rightAnchor.constraint(equalTo: slider.rightAnchor, constant: -40),
            playStack.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 32),
            playStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(optionsButton)
        optionsButton.rightAnchor.constraint(equalTo: slider.rightAnchor, constant: 0).isActive = true
        optionsButton.centerYAnchor.constraint(equalTo: songNameAndArtist.centerYAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [captionsButton, airPlayButton, modeButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stack.widthAnchor.constraint(equalToConstant: view.frame.width - 120),
            stack.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 100)
        ])
        
        let volumeStack = UIStackView(arrangedSubviews: [decreaseVolume, volumeSlider, increaseVolume])
        volumeStack.translatesAutoresizingMaskIntoConstraints = false
        volumeStack.axis = .horizontal
        volumeStack.alignment = .center
        volumeStack.distribution = .equalSpacing
        
        view.addSubview(volumeStack)
        volumeStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        volumeStack.topAnchor.constraint(equalTo: playStack.bottomAnchor, constant: 42).isActive = true
        volumeStack.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        
    }
    
    //MARK: - Selectors
    
    
    @objc func playButtonPressed() {
        if player.isPlaying {
            player.stop()
            let image = isSongPaused ? "pause.fill" : "play.fill"
            playButton.setLargeSize(image: image, size: 30)
            isSongPaused.toggle()
        } else {
            player.play()
            //            UIView.animate(withDuration: 0.2) {            ANIMATE
            //                self.songImage.frame = CGRect(x: 20,
            //                                              y: 20,
            //                                              width: self.slider.frame.width - 60,
            //                                              height: self.slider.frame.width - 60)
            //            }
            let image = isSongPaused ? "pause.fill" : "play.fill"
            playButton.setLargeSize(image: image, size: 30)
            isSongPaused.toggle()
            playButton.setLargeSize(image: "pause.fill", size: 30)
            slider.maximumValue = Float(player.duration)
        }
    }
    
    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
        if slider.value == 0.0 {
            isSongPaused = true
            playButton.setLargeSize(image: "play.fill", size: 30)
        }
    }
    
    @objc func sliderChanged() {
        player.stop()
        player.currentTime = TimeInterval(slider.value)
        player.prepareToPlay()
        player.play()
    }
}
