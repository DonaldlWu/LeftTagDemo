//
//  ViewController.swift
//  LeftTagDemo
//
//  Created by 吳得人 on 2017/10/27.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tahCollectionView: UICollectionView!
    
    var tagArray = ["Tag1", "Tag2", "VeryyyyLongTag", "Tag4", "Tag5", "Tag6", "Tag7", "Tag8"]
//    var tagArray = ["Tag1", "Tag2", "Tag3", "Tag4", "Tag5", "Tag6", "Tag7", "Tag8"]
    var widthData: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAlign()
    }
    
    func setupView() {
        tahCollectionView.delegate = self
        tahCollectionView.dataSource = self
        tahCollectionView.reloadData()
    }
    
    func setupAlign() {
        let flowLayout = TagCollectionViewAlignFlowLayout.init()
        tahCollectionView.collectionViewLayout = flowLayout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TagCollectionViewCell
        cell.textLabel.text = tagArray[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeOfString = NSString(string: tagArray[indexPath.row]).size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)])
        return CGSize(width: sizeOfString.width + 25, height: sizeOfString.height + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
