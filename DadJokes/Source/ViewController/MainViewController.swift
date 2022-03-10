//
//  MainViewController.swift
//  DadJokes
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    var navController: UINavigationController?
    let saveJokeButton = DJButton(bgColor: .systemGreen, title: "Save")
    let jokesLabel = DJTitleLabel(fontSize: 32)
    var joke: Jke? {
        didSet {
            jokesLabel.text = "\(joke?.joke ?? "")"
        }
    }
    var hasError = false
    var isLoading = false
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        coordinator?.getRandomJoke()
        configureReactionStackView()
        configureJokesLabel()
        configureCircleBackground()
        configureTitleLabel()
        view.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        view.bringSubviewToFront(reactionButtonStackView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Private Methods
    @objc
    private func didSwipe(_ sender: UISwipeGestureRecognizer){
        
        switch sender.direction {
        case .left:
            coordinator?.getRandomJoke()
        default:
            return
        }
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
    private func configureReactionStackView() {
        view.addSubview(reactionButtonStackView)
        NSLayoutConstraint.activate([
            reactionButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            reactionButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Padding.small.rawValue),
            reactionButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Padding.small.rawValue),
            reactionButtonStackView.heightAnchor.constraint(equalToConstant: Height.normal.rawValue)
        ])
    }
    
    private func configureJokesLabel() {
        view.addSubview(jokesLabel)
        NSLayoutConstraint.activate([
            jokesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Height.large.rawValue),
            jokesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            jokesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    private func configureCircleBackground() {
        view.addSubview(smallRedCircle)
        view.addSubview(largeRedCircle)
        view.addSubview(smallGreenCircle)
        view.addSubview(largeGreenCircle)
        view.addSubview(smallBlueCircle)
        view.addSubview(largeBlueCircle)
        
        NSLayoutConstraint.activate([
            // Small red circle
            smallRedCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            smallRedCircle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            smallRedCircle.heightAnchor.constraint(equalToConstant: 100),
            smallRedCircle.widthAnchor.constraint(equalToConstant: 100),
            
            // Large red circle
            largeRedCircle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            largeRedCircle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            largeRedCircle.heightAnchor.constraint(equalToConstant: 200),
            largeRedCircle.widthAnchor.constraint(equalToConstant: 200),
            
            // Small green circle
            smallGreenCircle.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            smallGreenCircle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            smallGreenCircle.heightAnchor.constraint(equalToConstant: 100),
            smallGreenCircle.widthAnchor.constraint(equalToConstant: 100),
            
            // Large green circle
            largeGreenCircle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            largeGreenCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            largeGreenCircle.heightAnchor.constraint(equalToConstant: 200),
            largeGreenCircle.widthAnchor.constraint(equalToConstant: 200),
            
            smallBlueCircle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            smallBlueCircle.topAnchor.constraint(equalTo: largeGreenCircle.bottomAnchor, constant: 20),
            smallBlueCircle.heightAnchor.constraint(equalToConstant: 100),
            smallBlueCircle.widthAnchor.constraint(equalToConstant: 100),
            
            largeBlueCircle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            largeBlueCircle.bottomAnchor.constraint(equalTo: largeRedCircle.topAnchor, constant: -10),
            largeBlueCircle.heightAnchor.constraint(equalToConstant: 200),
            largeBlueCircle.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private lazy var smallRedCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 50
        vw.backgroundColor = UIColor.systemRed
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var largeRedCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 100
        vw.backgroundColor = UIColor.systemRed
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var smallGreenCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 50
        vw.backgroundColor = UIColor.systemGreen
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var largeGreenCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 100
        vw.backgroundColor = UIColor.systemGreen
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var smallBlueCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 50
        vw.backgroundColor = UIColor.systemBlue
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var largeBlueCircle: UIView = {
        let vw = UIView(frame: .zero)
        vw.layer.cornerRadius = 100
        vw.backgroundColor = UIColor.systemBlue
        vw.layer.opacity = 0.1
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "dadjoke"
        return label
    }()
    
    // Reaction Buttons
    // 􀊴 = heart
    // 􀊁 = hand.thumbsdown
    // 􀉿 = hand.thumbsup
    // 􀈂 = square.and.arrow.up
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.addTarget(self, action: #selector(loveJoke(_:)), for: .touchUpInside)
        button.tintColor = .red
        return button
    }()
    
    private lazy var dislikeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        button.addTarget(self, action: #selector(dislikeJoke(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.addTarget(self, action: #selector(likeJoke(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.addTarget(self, action: #selector(shareJoke(_:)), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    private lazy var reactionButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartButton, dislikeButton, likeButton, shareButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
}
