import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct QRStandView: View {
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()

    var dataString: String = "https://www.acledabank.com.kh"

    var body: some View {
        VStack(spacing: 12) {
            Text("Scan to Pay")
                .font(.headline)
            qrImage
                .interpolation(.none)
                .resizable()
                .frame(width: 150, height: 150)
            Text("ACLEDA Bank")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }

    private var qrImage: Image {
        let data = Data(dataString.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage,
           let cgimg = context.createCGImage(outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10)), from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "xmark.circle")
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to MindCare")
                        .font(.largeTitle)
                        .bold()
                    Text("Daily mindfulness exercises and tips")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    HStack {
                        Spacer()
                        Image(systemName: "brain.head.profile")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding()
                        Spacer()
                    }
                    QRStandView()
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
