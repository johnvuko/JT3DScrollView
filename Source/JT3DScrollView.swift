//
//  JT3DScrollView.swift
//  JT3DScrollView
//
//  Created by Jonathan Tribouharet
//

import UIKit

public enum JT3DScrollViewEffect {
	case none, translation, depth, carousel, cards
}

open class JT3DScrollView: UIScrollView {

	open var angleRatio: CGFloat = 0
	open var rotationX: CGFloat = 0
	open var rotationY: CGFloat = 0
	open var rotationZ: CGFloat = 0
	open var translateX: CGFloat = 0
	open var translateY: CGFloat = 0

	open var effect: JT3DScrollViewEffect = .none {
		didSet {
			loadEffectValues()
		}
	}

	open var currentPage: Int {
		get {
			let pageWidth = self.frame.size.width
			if pageWidth <= 0 {
				return 0
			}

			let fractionalPage = max(self.contentOffset.x, 0) / pageWidth
			return Int(round(fractionalPage))
		}
	}

	public override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	open func commonInit() {
		isPagingEnabled = true
		clipsToBounds = false
		showsHorizontalScrollIndicator = false
		showsVerticalScrollIndicator = false
	}

	open func loadEffectValues() {
		switch effect {
			case .translation:
			angleRatio = 0
			rotationX = 0
			rotationY = 0
			rotationZ = 0
			translateX = 0.25
			translateY = 0.25
			case .depth:
			angleRatio = 0.5
			rotationX = -1
			rotationY = 0
			rotationZ = 0
			translateX = 0.25
			translateY = 0
			case .carousel:
			angleRatio = 0.5
			rotationX = -1
			rotationY = 0
			rotationZ = 0
			translateX = 0.25
			translateY = 0.25
			case .cards:
			angleRatio = 0.5
			rotationX = -1
			rotationY = -1
			rotationZ = 0
			translateX = 0.25
			translateY = 0.25
			case .none:
			angleRatio = 0
			rotationX = 0
			rotationY = 0
			rotationZ = 0
			translateX = 0
			translateY = 0
		}

		setNeedsDisplay()
	}

	open func loadNextPage (animated: Bool) {
		loadPageIndex(index: currentPage + 1, animated: animated)
	}

	open func loadPreviousPage (animated: Bool) {
		loadPageIndex(index: currentPage - 1, animated: animated)
	}

	open func loadPageIndex(index: Int, animated: Bool) {
		var newFrame = self.frame
		newFrame.origin.x = newFrame.size.width * CGFloat(index)
		newFrame.origin.y = 0

		scrollRectToVisible(newFrame, animated: animated)
	}

	open override func layoutSubviews () {
		super.layoutSubviews()

		let contentOffsetX = self.contentOffset.x
		for view in subviews {

			let t1 = view.layer.transform // Hack for avoid visual bug
			view.layer.transform = CATransform3DIdentity

			var distanceFromCenterX = view.frame.origin.x - contentOffsetX

			view.layer.transform = t1

			distanceFromCenterX = distanceFromCenterX * 100 / self.frame.width

			let angle = distanceFromCenterX * self.angleRatio

			let offset = distanceFromCenterX;
			let translateX = (self.frame.width * self.translateX) * offset / 100
			let translateY = (self.frame.width * self.translateY) * fabs(offset) / 100
			let t = CATransform3DMakeTranslation(translateX, translateY, 0)

			view.layer.transform = CATransform3DRotate(t, (angle * .pi / 180), self.rotationX, self.rotationY, self.rotationZ)
		}
	}

}
