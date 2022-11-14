//
//  HomePage_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 11/11/22.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class HomePage_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var labelTitle: UILabel!
  var text: String!
  @IBOutlet weak var collectionView: UICollectionView!
  
  let dataHomePage: [HomePage] = [
    HomePage(imageCover: "CoverMalinKundang", title: "TimunMas"),
    HomePage(imageCover: "CoverMalinKundangFix", title: "MalinKundang"),
    HomePage(imageCover: "CoverMalinKundang", title: "Sangkuriang")
  ]
  
  private var layout = CustomLayout()
  
  var itemW: CGFloat{
    return screenWidth * 0.40
  }
  
  var itemH: CGFloat{
    return itemW * 0.6
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    text = UserDefaults.standard.string(forKey: "name")
    let mainString = "Halo " + text + ", mau baca buku apa hari ini?"
    
    if text != nil{
      let attributedString = NSMutableAttributedString.init(string: mainString)
      let range = NSString(string: mainString).range(of: text, options: String.CompareOptions.caseInsensitive)
      attributedString.addAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.5669825077, blue: 0.3332064152, alpha: 1)], range: range)
      labelTitle.attributedText = attributedString
    }
    
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.decelerationRate = .fast
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
    assignbackground()
    collectionView.register(UINib(nibName: HomePage_CollectionViewCell.identifier, bundle: Bundle.main),
                            forCellWithReuseIdentifier: "HomePage_CollectionViewCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(collectionView)
    
    
    collectionView.collectionViewLayout = layout
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 50.0
    layout.minimumInteritemSpacing = 50.0
    collectionView.frame = .zero
    layout.itemSize.width = itemW
    collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let indexPath = IndexPath(item: 1, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    layout.currentPage = indexPath.item
    layout.previousOffset = layout.updateOffset(collectionView)
    if let cell = collectionView.cellForItem(at: indexPath){
      transformCell(cell)
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataHomePage.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePage_CollectionViewCell.identifier,
                                                  for: indexPath) as! HomePage_CollectionViewCell
    cell.configureCell(HomePage: dataHomePage[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: itemW, height: itemH)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let dataHomePage = dataHomePage[indexPath.item]
    if indexPath.item == layout.currentPage{
      if dataHomePage.title == "MalinKundang" {
        let nextDetailPage = DetailPage_ViewController(nibName: "DetailPage_ViewController", bundle: nil)
        present(nextDetailPage, animated: true, completion: nil)
      }else{
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        layout.currentPage = indexPath.item
        layout.previousOffset = layout.updateOffset(collectionView)
        setupCell()
      }
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if decelerate{
      setupCell()
    }
  }
  
  private func setupCell(){
    let indexPath = IndexPath(item: layout.currentPage, section: 0)
    if let cell = collectionView.cellForItem(at: indexPath){
      cell.alpha = 0.2
      transformCell(cell)
    }
  }
  
  private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true){
    
    
    for otherCell in collectionView.visibleCells{
      if !isEffect{
        cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        return
      }
      
      UIView.animate(withDuration: 0.2){
        cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
      }
      if let indexPath = collectionView.indexPath(for: otherCell){
        
        if indexPath.item != layout.currentPage{
          UIView.animate(withDuration: 0.2){
            otherCell.transform = .identity
            otherCell.alpha = 0.4
            cell.alpha = 1
            cell.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.white.cgColor
            cell.layer.shadowOffset =  CGSize.zero
            cell.layer.shadowOpacity = 20
            cell.layer.shadowRadius = 17
            
            otherCell.layer.shadowColor = UIColor.white.cgColor
            otherCell.layer.shadowOffset =  CGSize.zero
            otherCell.layer.shadowOpacity = 0
            otherCell.layer.shadowRadius = 15
          }
        }
      }
    }
  }
  
  
  func assignbackground(){
    let background = UIImage(named: "BackgroundHome")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
}


