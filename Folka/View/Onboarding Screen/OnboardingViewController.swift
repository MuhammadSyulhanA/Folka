//
//  OnboardingViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 01/12/22.
//

import UIKit

struct Page{
  let image: String
  let title: String
  let description: String
}

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var buttonStart: UIButton!
  @IBOutlet weak var collectionViewImage: UICollectionView!
  var customButtonMulai: UIImage!
  
  
  let pages: [Page] = [Page(image: "onboardingOne", title: "Baca Dongeng Interaktif", description: "Baca dongeng cerita rakyat Indonesia sambil bermain."),
                       Page(image: "onboardingTwo", title: "Mari Kita Mulai", description: "Siap membaca dan menjelajah dengan Folka.")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assignbackground()
    
    buttonStart.setTitle("", for: .normal)
    customButtonMulai = UIImage(named: "buttonMulaiBoarding")
    buttonStart.setImage(customButtonMulai?.withRenderingMode(.alwaysOriginal), for: .normal)
    buttonStart.isHidden = true
    collectionViewImage.dataSource = self
    collectionViewImage.delegate = self
    collectionViewImage.clipsToBounds = false
    collectionViewImage.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main),
                                 forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    pageControl.numberOfPages = self.pages.count
    collectionViewImage.backgroundColor = UIColor.clear.withAlphaComponent(0)
    collectionViewImage.contentInsetAdjustmentBehavior = .never
    if let layout = collectionViewImage.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .horizontal
      collectionViewImage!.collectionViewLayout = layout
    }
    
  }
  
  @IBAction func buttonStart(_ sender: UIButton) {
    let nextProfileOnboard = ProfileOnboard_ViewController(nibName: "ProfileOnboard_ViewController", bundle: nil)
    present(nextProfileOnboard, animated: true, completion: nil)
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroundOnboarding")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @IBAction func pageChanged(_ sender: Any) {
    let pc = sender as! UIPageControl
    
    // scrolling the collectionView to the selected page
    collectionViewImage.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionViewImage.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier,
                                                       for: indexPath) as! OnboardingCollectionViewCell
    // function for configuring the cell, defined in the Custom cell class
    cell.configureCell(page: pages[indexPath.item])
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if pageControl.currentPage == 1{
      buttonStart.isHidden = true
    } else if pageControl.currentPage == 0 {
      buttonStart.isHidden = false
    }
    print("\(pageControl.currentPage)")
    pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
  }
  
  
  
}
