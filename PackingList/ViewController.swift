import UIKit

class ViewController: UIViewController {
  
  //MARK:- IB outlets
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var buttonMenu: UIButton!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var heightConstraint: NSLayoutConstraint!
  @IBOutlet var addLeftConstraint: NSLayoutConstraint!
  
  //MARK:- further class variables
  
  var slider: HorizontalItemList!
  var menuIsOpen = false
  var items: [Int] = [5, 6, 7]
  
  //MARK:- class methods
  
  @IBAction func toggleMenu(_ sender: AnyObject) {
    menuIsOpen = !menuIsOpen
    
    titleLabel.text = !menuIsOpen ? "Select Item" : "Packing List!!!!!!!!!!!!!!!"
    view.layoutIfNeeded()
    
    heightConstraint.constant = menuIsOpen ? 200 : 60
    addLeftConstraint.constant = menuIsOpen ? 16 : 8
    
    let angel: CGFloat = menuIsOpen ? .pi / 4 : 0
    
    UIView.animate(withDuration: 0.3, animations: {
      self.buttonMenu.transform = CGAffineTransform(rotationAngle: angel)
      self.view.layoutIfNeeded()
    }, completion: nil)
    
  }
  
  func showItem(_ index: Int) {
    let imageView = makeImageView(index: index)
    view.addSubview(imageView)
    _ = imageView.anchorCenter(x: view.centerXAnchor, y: nil)
    
    let ( wAnchor, hAnchor ) = imageView.anchorWHC(width: 50, height: 50)
    let (_ ,_ ,_ ,bAnchor) = imageView.anchorEdges(top: nil, tConst: 0, left: nil, lConst: 0, right: nil, rConst: 0, bottom: view.bottomAnchor, bConst: 90)
    view.layoutIfNeeded()
    
    bAnchor?.constant = -30
    wAnchor?.constant = 100
    hAnchor?.constant = 100
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
    }) { (_) in
      bAnchor?.constant = 50
      wAnchor?.constant = 0
      hAnchor?.constant = 0
      UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseInOut, animations: {
        self.view.layoutIfNeeded()
      }, completion: { (_) in
        imageView.removeFromSuperview()
      })
    }
    
  }
  
  func transitionCloseMenu() {
    delay(seconds: 0.35, completion: {
      self.toggleMenu(self)
    })
  }
}


let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

// MARK:- View Controller

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func makeImageView(index: Int) -> UIImageView {
    let imageView = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
    imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    imageView.layer.cornerRadius = 5.0
    imageView.layer.masksToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }
  
  func makeSlider() {
    slider = HorizontalItemList(inView: view)
    slider.didSelectItem = {index in
      self.items.append(index)
      self.tableView.reloadData()
      self.transitionCloseMenu()
    }
    self.titleLabel.superview?.addSubview(slider)
  }
  
  // MARK: View Controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    makeSlider()
    self.tableView?.rowHeight = 54.0
  }
  
  // MARK: Table View methods
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
    cell.accessoryType = .none
    cell.textLabel?.text = itemTitles[items[indexPath.row]]
    cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    showItem(items[indexPath.row])
  }
  
}
