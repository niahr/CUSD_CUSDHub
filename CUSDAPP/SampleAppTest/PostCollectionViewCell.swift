//
//  PostCollectionViewCell.swift
//  SampleAppTest
//
//  Created by Lara Kulkarni on 10/30/22.
//


import SwiftUI

class PostCollectionViewCell: UICollectionViewCell {
    private var postQuestion = UITextField()
     
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        postQuestion.contentMode = .scaleAspectFit
        postQuestion.translatesAutoresizingMaskIntoConstraints = false
        postQuestion.textAlignment = .center
        postQuestion.font = .systemFont(ofSize: 18)
        contentView.addSubview(postQuestion)
        contentView.backgroundColor = .lightGray
        contentView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.borderWidth = 2
       // contentView.backgroundColor = CGColor(srgbRed: 174.0, green: 189.0, blue: 123.0, alpha: 1)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureFooter(post:Post){
        postQuestion.text = post.name
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            postQuestion.topAnchor.constraint(equalTo:contentView.topAnchor), postQuestion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), postQuestion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), postQuestion.bottomAnchor.constraint(equalTo:contentView.bottomAnchor)
        ])
    }
}

