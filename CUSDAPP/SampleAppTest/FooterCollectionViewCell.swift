//
//  FooterCollectionViewCell.swift
//  SampleAppTest
//
//  Created by Lara Kulkarni on 10/30/22.
//

import SwiftUI

class FooterCollectionViewCell: UICollectionViewCell {
    private var footerName = UILabel()
     
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        footerName.contentMode = .scaleAspectFit
        footerName.translatesAutoresizingMaskIntoConstraints = false
        footerName.textAlignment = .center
        footerName.font = .systemFont(ofSize: 18)
        contentView.addSubview(footerName)
        contentView.backgroundColor = .systemGreen
        contentView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.borderWidth = 2
       // contentView.backgroundColor = CGColor(srgbRed: 174.0, green: 189.0, blue: 123.0, alpha: 1)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureFooter(footer:Footer){
        footerName.text = footer.name
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            footerName.topAnchor.constraint(equalTo:contentView.topAnchor), footerName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), footerName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), footerName.bottomAnchor.constraint(equalTo:contentView.bottomAnchor)
        ])
    }
}
