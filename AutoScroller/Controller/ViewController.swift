

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var datingImg1: UIImageView!
    
    @IBOutlet weak var datingImg2: UIImageView!

    
    
    var imgArr = [  UIImage(named:"image3"),
                    UIImage(named:"image5") ,
                    UIImage(named:"images4") ,
                    UIImage(named:"images6") ,
                    UIImage(named:"image7") ,
                    UIImage(named:"imagesgroup") ,
                    UIImage(named:"coupledoll") 
                     ]
    
    var timer = Timer()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
//datingImg.layer.cornerRadius = datingImg1.frame.size.width / 2.0
//        datingImg1.layer.cornerRadius = 1
        
//        datingImg1.setRounded()
    }
////        datingImg1.layer.borderWidth = 1
//        datingImg1.layer.masksToBounds = false
//         datingImg1.layer.borderColor = UIColor.black.cgColor
//datingImg1.layer.cornerRadius = datingImg1.frame.height/2
//datingImg1.clipsToBounds = true
//    }
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @objc func changeImage() {
    
    if counter < imgArr.count {
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageView.currentPage = counter
        counter += 1
    } else {
        counter = 0
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        pageView.currentPage = counter
        counter = 1
    }
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        } 
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
//extension UIImageView {
//
//    func makeRounded() {
//
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//    }
//}

//extension UIImageView {
//
//   func setRounded() {
//    let radius = self.frame.width / 2
//      self.layer.cornerRadius = radius
//      self.layer.masksToBounds = true
//   }
//}




