//
//  ViewController.swift
//  SampleAppTest
//
//  Created by Lara Kulkarni on 10/2/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    
    var sampleLabel = UILabel()
    var enterButton = UIButton()
    var logo = UIImage(named: "image")
    var logoView = UIImageView()
    var box1 = UITextField()
    var box2 = UITextField()
    var box3 = UITextField()
    var box4 = UITextField()
    var box5 = UITextField()
    private var footerView: UICollectionView!
    private var footerCellReuseIdentifier = "footerCellReuseIdentifier"
    private var menuOptions: [Footer] = [Footer(name: "Home"),Footer(name: "Post"),Footer(name: "Friends"), Footer(name: "Messages")]
    private var samplePosts: [Post] = [Post(name: "Can I switch subteams?"),Post(name: "How does CUSD work?"),Post(name: "What subteams are you in?"), Post(name: "What does TechOps do?"), Post(name: "When is the next gbody?")]
    private var postView: UICollectionView!
    private var postCellReuseIdentifier = "postCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        sampleLabel.text = "CUSD"
        sampleLabel.textColor = .black
        sampleLabel.font = .systemFont(ofSize: 50, weight: .bold)
        sampleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sampleLabel)
        
        
        
        box1.text = "Can I switch subteams?"
        box1.textColor = .black
        box1.font = .systemFont(ofSize: 20, weight: .bold)
        box1.backgroundColor = .lightGray
        box1.textAlignment = .center
        box1.translatesAutoresizingMaskIntoConstraints = false
        // view.addSubview(box1)
        
        box2.text = "How does CUSD work?"
        box2.textColor = .black
        box2.backgroundColor = .lightGray
        box2.font = .systemFont(ofSize: 20, weight: .bold)
        box2.textAlignment = .center
        box2.translatesAutoresizingMaskIntoConstraints = false
        //  view.addSubview(box2)
        
        box3.backgroundColor = .lightGray
        box3.text = "What subteams are you in?"
        box3.textAlignment = .center
        box3.textColor = .black
        box3.font = .systemFont(ofSize: 20, weight: .bold)
        box3.translatesAutoresizingMaskIntoConstraints = false
        //    view.addSubview(box3)
        
        box4.backgroundColor = .lightGray
        box4.text = "What does TechOps do?"
        box4.textColor = .black
        box4.font = .systemFont(ofSize: 20, weight: .bold)
        box4.textAlignment = .center
        box4.translatesAutoresizingMaskIntoConstraints = false
        //  view.addSubview(box4)
        
        box5.backgroundColor = .lightGray
        box5.text = "When is the next gbody?"
        box5.textColor = .black
        box5.font = .systemFont(ofSize: 20, weight: .bold)
        box5.textAlignment = .center
        box5.translatesAutoresizingMaskIntoConstraints = false
        //    view.addSubview(box5)
        
        logoView.image = UIImage(named: "image")
        logoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoView)
        
        
        enterButton.backgroundColor = .systemMint
        enterButton.setTitle("Log In", for: .normal)
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.layer.borderWidth = 1
        enterButton.layer.borderColor = UIColor.systemMint.cgColor
        enterButton.layer.cornerRadius = 10
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        //  view.addSubview(enterButton)
        
        let menuFooter = UICollectionViewFlowLayout()
        menuFooter.scrollDirection = .horizontal
        menuFooter.minimumLineSpacing = 0
        menuFooter.minimumInteritemSpacing = 0
        menuFooter.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        footerView = UICollectionView(frame: .zero, collectionViewLayout: menuFooter)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.allowsMultipleSelection = true
        footerView.backgroundColor = .clear
        
        footerView.register(FooterCollectionViewCell.self, forCellWithReuseIdentifier: footerCellReuseIdentifier)
        footerView.dataSource = self
        footerView.delegate = self
        view.addSubview(footerView)
        
        
        let postHome = UICollectionViewFlowLayout()
        postHome.scrollDirection = .vertical
        postHome.minimumLineSpacing = 5
        postHome.minimumInteritemSpacing = 5
        postHome.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        postView = UICollectionView(frame: .zero, collectionViewLayout: postHome)
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.allowsMultipleSelection = true
        postView.backgroundColor = .clear
        
        postView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: postCellReuseIdentifier)
        postView.dataSource = self
        postView.delegate = self
        view.addSubview(postView)
        
        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: 0), footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -10),footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 7), footerView.heightAnchor.constraint(equalToConstant: 70)
            
        ])
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 100), postView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -10),postView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 7), postView.heightAnchor.constraint(equalToConstant: 390)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            sampleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            sampleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor, constant: -40)
            //logoView.heightAnchor.constraint(equalToConstant: 100),
            //logoView.widthAnchor.constraint(equalToConstant: 270)
        ])}
        
        
//        NSLayoutConstraint.activate([
//            box1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            box1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            box1.heightAnchor.constraint(equalToConstant: 100),
//            box1.widthAnchor.constraint(equalToConstant: 270)
//        ])}
//        NSLayoutConstraint.activate([
//          box2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 225),
//          box2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          box2.heightAnchor.constraint(equalToConstant: 100),
//          box2.widthAnchor.constraint(equalToConstant: 270)
//        ])
//
//        NSLayoutConstraint.activate([
//          box3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
//          box3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          box3.heightAnchor.constraint(equalToConstant: 100),
//          box3.widthAnchor.constraint(equalToConstant: 270)
//        ])
//
//        NSLayoutConstraint.activate([
//          box4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 475),
//          box4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          box4.heightAnchor.constraint(equalToConstant: 100),
//          box4.widthAnchor.constraint(equalToConstant: 270)
//        ])
//        NSLayoutConstraint.activate([
//          box5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
//          box5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          box5.heightAnchor.constraint(equalToConstant: 100),
//          box5.widthAnchor.constraint(equalToConstant: 270)
//        ])
//        NSLayoutConstraint.activate([
//          logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//          logoView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor, constant: -40)
//          //logoView.heightAnchor.constraint(equalToConstant: 100),
//          //logoView.widthAnchor.constraint(equalToConstant: 270)
//        ])

        
        
  //  }
    
//    struct Box: View {
//        var body: UILabel {
//
//        }
//
//    }
    
    struct ContentView: View {
        var body: some View {
            GroupBox(
                label: Label("Heart Rate", systemImage: "heart.fill")
                    .foregroundColor(.red)
            ) {
                Text("Your hear rate is 90 BPM.")
            }.padding()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == footerView){
            return menuOptions.count
        }
        else{
            return samplePosts.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == footerView){
            if let cell = footerView.dequeueReusableCell(withReuseIdentifier: footerCellReuseIdentifier, for: indexPath) as? FooterCollectionViewCell{
                let footerOp = menuOptions[indexPath.row]
                cell.configureFooter(footer: footerOp)
                return cell
            }
            else{
                return UICollectionViewCell()        }
        }
        else{
                if let cell = postView.dequeueReusableCell(withReuseIdentifier: postCellReuseIdentifier, for: indexPath) as? PostCollectionViewCell{
                    let footerOp = samplePosts[indexPath.row]
                    cell.configureFooter(post: footerOp)
                    return cell
                }
                else{
                    return UICollectionViewCell()        }
            }
        }
        
    }
    
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(footerView == collectionView){
            let rowsnum: CGFloat = 5
            let size1 = rowsnum
            return CGSize(width: 94, height: 200)}
        else{
            return CGSize(width:300, height: 100)
        }
    }
    
}
