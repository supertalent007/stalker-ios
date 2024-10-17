import UIKit
import FLAnimatedImage

@IBDesignable
public class ElementView: UIView {

    public struct Defaults {
        // Set default background color to black
        public static let backgroundColor = UIColor.black 
    }

    public var gifImageView: FLAnimatedImageView!

    public override var intrinsicContentSize: CGSize {
        return super.intrinsicContentSize
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
        gifImageView = FLAnimatedImageView()
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
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

        // Set up constraints to make the gifImageView fill the entire ElementView
        NSLayoutConstraint.activate([
            gifImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gifImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gifImageView.topAnchor.constraint(equalTo: topAnchor),
            gifImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
