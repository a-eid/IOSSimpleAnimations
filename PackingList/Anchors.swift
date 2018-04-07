import UIKit


extension UIView {
  // top bottom left and right
  func anchorEdges(top: NSLayoutYAxisAnchor?, tConst: CGFloat = 0,
                   left: NSLayoutXAxisAnchor?, lConst: CGFloat = 0 ,
                   right: NSLayoutXAxisAnchor?, rConst: CGFloat = 0 ,
                   bottom: NSLayoutYAxisAnchor?, bConst: CGFloat = 0
    ) -> (NSLayoutConstraint?, NSLayoutConstraint?, NSLayoutConstraint?, NSLayoutConstraint?) {

    self.translatesAutoresizingMaskIntoConstraints = false
    
    var t: NSLayoutConstraint?
    var l: NSLayoutConstraint?
    var r: NSLayoutConstraint?
    var b: NSLayoutConstraint?
    
    if let top = top {
      t = topAnchor.constraint(equalTo: top, constant: tConst)
      t?.isActive = true
    }
    
    if let left = left {
      l = leftAnchor.constraint(equalTo: left, constant: lConst)
      l?.isActive = true
    }
    
    if let right = right {
      r = rightAnchor.constraint(equalTo: right, constant: rConst)
      r?.isActive = true
    }
    if let bottom = bottom {
      b = bottomAnchor.constraint(equalTo: bottom, constant: bConst)
      b?.isActive = true
    }
    return (t,l,r,b)
  }
  
  // width height
  func anchorWH(
    width: NSLayoutDimension?,
    wMultiplier: CGFloat = 1,
    height: NSLayoutDimension?,
    hMultiplier: CGFloat = 1
  ) -> (NSLayoutConstraint?, NSLayoutConstraint?) {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var w: NSLayoutConstraint?
    var h: NSLayoutConstraint?
    
    if let width = width {
      w = self.widthAnchor.constraint(equalTo: width, multiplier: wMultiplier)
      w?.isActive = true

    }
    if let height = height {
      h = self.heightAnchor.constraint(equalTo: height, multiplier: hMultiplier)
      h?.isActive = true
    }
    
    return (w, h)
  }
  
  func anchorWHC(width: CGFloat?, height: CGFloat?)-> (NSLayoutConstraint?, NSLayoutConstraint?) {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var w: NSLayoutConstraint?
    var h: NSLayoutConstraint?

    if let width = width {
      w = self.widthAnchor.constraint(equalToConstant: width)
      w?.isActive = true
    }
    
    if let height = height {
      h = self.heightAnchor.constraint(equalToConstant: height)
      h?.isActive = true
    }
    return (w, h)
  }
  
  // centerXY
  func anchorCenter(
    x: NSLayoutXAxisAnchor?, xConstant: CGFloat = 0,
    y: NSLayoutYAxisAnchor?, yConstant: CGFloat = 0
    ) -> (NSLayoutConstraint?, NSLayoutConstraint?) {
      
      var xc: NSLayoutConstraint?
      var yc: NSLayoutConstraint?
      
      self.translatesAutoresizingMaskIntoConstraints = false
      
      if let x = x {
        xc = self.centerXAnchor.constraint(equalTo: x, constant: xConstant)
        xc?.isActive = true
      }
      if let y = y {
        yc = self.centerYAnchor.constraint(equalTo: y, constant: yConstant)
        yc?.isActive = true
      }
      
      return (xc, yc)
  }
  
}





