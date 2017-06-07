# JT3DScrollView

[![CI Status](http://img.shields.io/travis/jonathantribouharet/JT3DScrollView.svg)](https://travis-ci.org/jonathantribouharet/JT3DScrollView)
![Version](https://img.shields.io/cocoapods/v/JT3DScrollView.svg)
![License](https://img.shields.io/cocoapods/l/JT3DScrollView.svg)
![Platform](https://img.shields.io/cocoapods/p/JT3DScrollView.svg)

JT3DScrollView is a UIScrollView with custom effects during the scroll.

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your Podfile.

    pod 'JT3DScrollView', '~> 2.0'

## Screenshots

![Example](./Screens/example.gif "Example")


## Usage

You can use it like a classic UIScrollView, the `isPagingEnabled` is set to `true` by default and `clipsToBounds` is set to `false`.

```swift
import UIKit
import JT3DScrollView

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: JT3DScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView?.effect = .cards
    }
}
```

You can disable the effect and act like a classic `UIScrollView` by setting `effect` to `.none`.

Effects are just preset for some properties used for the animations, you can adjust all effects with:

- `angleRatio`
- `rotationX`
- `rotationY`
- `rotationZ`
- `translateX`
- `translateY`

All this properties are relative to the position X of the subview.

## Requirements

- iOS 8 or higher
- Swift 3.0

## Author

- [Jonathan Tribouharet](https://github.com/jonathantribouharet) ([@johntribouharet](https://twitter.com/johntribouharet))

## License

JT3DScrollView is released under the MIT license. See the LICENSE file for more info.
