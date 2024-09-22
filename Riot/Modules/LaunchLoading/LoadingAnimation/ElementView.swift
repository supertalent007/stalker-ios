import UIKit
import FLAnimatedImage

@IBDesignable
public class ElementView: UIView {
    
    public struct Defaults {
        public static let size = CGSize(width: 130.16, height: 127.75)
        public static let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.021)
    }

    public var gifImageView: FLAnimatedImageView!

    public override var intrinsicContentSize: CGSize {
        return Defaults.size
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = Defaults.backgroundColor
        clipsToBounds = false
        createGifView()
    }

    private func createGifView() {
        // Initialize the FLAnimatedImageView
        gifImageView = FLAnimatedImageView(frame: CGRect(x: 0, y: 0, width: Defaults.size.width, height: Defaults.size.height))
        gifImageView.contentMode = .scaleAspectFit
        
        // Load the GIF from the bundle
        if let path = Bundle.main.path(forResource: "splash_screen", ofType: "gif") {
            do {
                let gifData = try Data(contentsOf: URL(fileURLWithPath: path))
                let gif = FLAnimatedImage(animatedGIFData: gifData)
                gifImageView.animatedImage = gif
            } catch {
                print("Error loading GIF: \(error)")
            }
        }

        // Add the GIF view to the main view
        addSubview(gifImageView)
    }
}
