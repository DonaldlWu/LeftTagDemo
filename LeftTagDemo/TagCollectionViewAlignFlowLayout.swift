//
//  TagCollectionViewAlignFlowLayout.swift
//  LeftTagDemo
//
//  Created by 吳得人 on 2017/10/27.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit

class TagCollectionViewAlignFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var layoutAttributes: [UICollectionViewLayoutAttributes] = []
    private var contentSize: CGSize = CGSize.zero
    
    override var collectionViewContentSize: CGSize {
        if self.scrollDirection == .vertical {
            return CGSize.init(width: self.collectionView!.frame.width, height: contentSize.height)
        }
        return CGSize.init(width: contentSize.width, height: self.collectionView!.frame.height)
    }
    
    override func prepare() {
        super.prepare()
        contentSize = CGSize.zero
        let itemNum: Int = self.collectionView!.numberOfItems(inSection: 0)
        layoutAttributes.removeAll()
        for i in 0..<itemNum {
            let layoutAttr = layoutAttributesForItem(at: IndexPath.init(row: i, section: 0))
            layoutAttributes.append(layoutAttr!)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        var size = self.itemSize
        if self.collectionView!.delegate != nil && self.collectionView!.delegate!.conforms(to: UICollectionViewDelegateFlowLayout.self) && self.collectionView!.delegate!.responds(to: #selector(UICollectionViewDelegateFlowLayout.collectionView(_:layout:sizeForItemAt:)))  {
            let flowLayoutDelegate = self.collectionView!.delegate as! UICollectionViewDelegateFlowLayout
            size = flowLayoutDelegate.collectionView!(self.collectionView!, layout: self, sizeForItemAt: indexPath)
        }
        var frame = CGRect.zero
        var x: CGFloat = 0
        var y: CGFloat = 0
        let collectionViewWidth: CGFloat = self.collectionView!.bounds.width
        x = self.sectionInset.left
        y = self.sectionInset.top
        self.scrollDirection = .vertical
        if layoutAttributes.count > 0 {
            let lastLayoutAttr = layoutAttributes.last!
            if lastLayoutAttr.frame.maxX + self.minimumInteritemSpacing + size.width + self.sectionInset.right > collectionViewWidth {
                y = lastLayoutAttr.frame.maxY + self.minimumLineSpacing
            } else {
                x = lastLayoutAttr.frame.maxX + self.minimumInteritemSpacing
                y = lastLayoutAttr.frame.minY
            }
        }
        frame = CGRect(x: x, y: y, width: size.width, height: size.height)
        contentSize.width = frame.maxX + self.sectionInset.right
        contentSize.height = frame.maxY + self.sectionInset.bottom
        let layoutAttr = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        layoutAttr.frame = frame
        return layoutAttr
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes
    }
}
