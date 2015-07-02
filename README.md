# MTLTabBarView

MTLTabBarView is a simple navigation bar written in Swift. It's highly configurable.

## Installation

Just add MTLTabBarView.swift to your XCode project.

## Usage

### Implement the MTLTabBarViewDelegate protocol

```swift
class MTLDetailViewController: UIViewController, SDTabBarViewDelegate {

}
```

### Add the tab bar to your view
```swift
tabBarView = MTLTabBarView(frame: CGRectMake(0, CGRectGetMaxY(headerView.frame), self.view.frame.size.width, 60), titles: ["ABOUT", "DETAILS", "LOCATION"])
tabBarView.font = UIFont(name: "GothamRounded-Medium", size: 16)
tabBarView.titleColorNormal = Constants.Colors.lightGrayText
tabBarView.titleColorHighlighted = UIColor.whiteColor()
tabBarView.titleColorSelected = UIColor.whiteColor()
tabBarView.delegate = self
self.view.addSubview(tabBarView)
```
### Implement buttonTappedAtIndex
```swift
func buttonTappedAtIndex(index: Int) {
        switch index{
        case 0:
           //do something
        }
    }
 ```