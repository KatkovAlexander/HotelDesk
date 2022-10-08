//
//  QRScannerViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//

import UIKit
import AVFoundation
import PanModal

class QRScannerViewController: UIViewController {
    
    var output: QRScannerViewControllerOutput!

    // MARK: Outlets
    
    @IBOutlet private weak var titleView: UIView! {
        didSet {
            titleView.isHidden = false
        }
    }
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Отсканируйте QR-код,\nчтобы авторизироваться"
        }
    }
    @IBOutlet private weak var errorView: DesignableView! {
        didSet {
            errorView.isHidden = true
        }
    }
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var qrCodeBordersView: DesignableView!
    
    // MARK: Private Properties
    
    private var didQrCodeCathced = false
    private var captureSession = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var qrCodeFrameView: UIView?
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeRecognizer.direction = .right
        view.addGestureRecognizer(swipeRecognizer)
        
        output.viewDidLoad()
    }
    
    private func openBackCamera() {
        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            
            output.errorCathed(error: "Failed to get the camera device")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = Globals.supportedCodeTypes
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            captureSession.startRunning()
            
            view.bringSubviewToFront(titleView)
            view.bringSubviewToFront(errorView)
            view.bringSubviewToFront(qrCodeBordersView)
        } catch {
            output.errorCathed(error: error.localizedDescription)
            return
        }
    }
    // MARK: Action
    
    @objc private func handleSwipeGesture() {
        print(#fileID, #function)
        
        output.didSwipeRight()
    }
}

// MARK: Extension - QRScannerPresenterToViewProtocol 
extension QRScannerViewController: QRScannerViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
        openBackCamera()
    }
    
    func showError(error: String) {
        errorView.isHidden = false
        errorLabel.text = error
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.errorView.isHidden = true
        }
    }
    
    func close() {
        dismiss(animated: true)
    }
}

extension QRScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if !didQrCodeCathced {
            self.output.qrCodeGetted(data: metadataObjects)
            didQrCodeCathced = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.didQrCodeCathced = false
            }
        }
    }
}

extension QRScannerViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .maxHeight
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeight
    }
    
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return true
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return true
    }
}
