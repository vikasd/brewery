//
//  BeerDetailsViewController.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 29/09/21.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    let beerViewModel: BeerViewModel
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var tagLineLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var volumeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var boilVolumeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var methodLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var ingredientsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var foodPairingLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var brewersTipLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var contributorLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    init(_ beerViewModel: BeerViewModel) {
        
        self.beerViewModel = beerViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setBeerData(self.beerViewModel)
    }
    
    func setupUI() {
        
        let safeAreaLayout = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(scrollView)
        self.view.backgroundColor = .white
        
        scrollView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor).isActive = true
        safeAreaLayout.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        safeAreaLayout.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor).isActive = true
        
        let holderView = UIView()
        holderView.translatesAutoresizingMaskIntoConstraints = false
        holderView.backgroundColor = .clear
        
        scrollView.addSubview(holderView)
        
        holderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        holderView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor).isActive = true
        
        holderView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        holderView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 20).isActive = true
        holderView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20).isActive = true
        holderView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        
        
        // Add ImageView
        stackView.addArrangedSubview(getImageView())
        
        // Add Name & Tagline
        stackView.addArrangedSubview(getProductNameAndDetailsView())
        
        // Add Detail Label
        stackView.addArrangedSubview(detailLabel)
        
        // Add Volume Labels
        stackView.addArrangedSubview(getVolumeDetailView())
        
        // Add Method Label
        stackView.addArrangedSubview(methodLabel)
        
        // Add Ingredients Label
        stackView.addArrangedSubview(ingredientsLabel)
        
        // Add Food pairing Label
        stackView.addArrangedSubview(foodPairingLabel)
        
        // Add Brewers Tip Label
        stackView.addArrangedSubview(brewersTipLabel)
        
        // Add Contributor Label
        stackView.addArrangedSubview(contributorLabel)
    }
    
    func getImageView() -> UIView {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        return stackView
    }
    
    func getProductNameAndDetailsView() -> UIView {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(tagLineLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        return stackView
    }
    
    func getVolumeDetailView() -> UIView {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        stackView.addArrangedSubview(volumeLabel)
        stackView.addArrangedSubview(boilVolumeLabel)
        
        return stackView
    }
}


// MARK: Set Data
extension BeerDetailsViewController {
    
    func setBeerData(_ beerViewModel: BeerViewModel) {
        
        if let url = beerViewModel.imageURL,
           let data = try? Data(contentsOf: url) {
            
            imageView.image = UIImage(data: data)
        }
        
        titleLabel.text = beerViewModel.name
        tagLineLabel.text = beerViewModel.tagline
        descriptionLabel.text = beerViewModel.description
        detailLabel.attributedText = beerViewModel.details
        
        volumeLabel.attributedText = beerViewModel.volume
        boilVolumeLabel.attributedText = beerViewModel.boilVolume
        
        methodLabel.attributedText = beerViewModel.method
        ingredientsLabel.attributedText = beerViewModel.ingredients
        
        foodPairingLabel.attributedText = beerViewModel.foodPairing
        brewersTipLabel.attributedText = beerViewModel.brewersTip
        contributorLabel.attributedText = beerViewModel.contributor
    }
}
