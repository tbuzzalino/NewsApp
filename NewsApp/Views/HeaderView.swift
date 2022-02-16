//
//  HeaderView.swift
//  NewsApp
//
//  Created by Tomas Buzzalino on 15/02/2022.
//

import UIKit

class HeaderView : UIView {
    
    private var fontSize : CGFloat
    
    private lazy var headingLabel : UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "News"
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        return v
    }()
    
    private lazy var headerCircleImage : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        image.image = UIImage(systemName: "circle.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return image
    }()
    
    private lazy var plusImage : UIImageView = {
        let plus = UIImageView()
        plus.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        plus.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return plus
    }()
    
    private lazy var subheadingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top Headlines"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = .gray
        return label
    }()
    
    private lazy var headerStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    init(fontSize : CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadingLabel)

        setupConstrains()
    }
    
    func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
            subheadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadingLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadingLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
}
