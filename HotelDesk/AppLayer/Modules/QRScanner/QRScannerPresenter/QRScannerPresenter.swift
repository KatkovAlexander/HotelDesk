//
//  QRScannerPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//

import Foundation
import AVFoundation

class QRScannerPresenter {

    // MARK: Dependencies
    
    private weak var view:  QRScannerViewControllerInput?
    private let interactor: QRScannerInteractorInput
    private let router: QRScannerRouterInput
    
    init(view: QRScannerViewControllerInput,
         interactor: QRScannerInteractorInput,
         router: QRScannerRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: Extension - QRScannerViewToPresenterProtocol
extension QRScannerPresenter: QRScannerViewControllerOutput {
    
    func viewDidLoad() {
        view?.initialSetup(title: "Отсканируйте QR-код")
    }
    
    
    func qrCodeGetted(data: [AVMetadataObject]) {
        if data.count == 0 {
            view?.showError(error: "No QR code is detected")
            return
        }
        
        if let metadataObj = data[0] as? AVMetadataMachineReadableCodeObject,
           Globals.supportedCodeTypes.contains(metadataObj.type) {

            if let metadataObj = metadataObj.stringValue {
                if metadataObj == Globals.correctLink {
                    router.openMain()
                } else {
                    view?.showError(error: "Неверный QR код")
                }
            } else {
                view?.showError(error: "Что-то пошло не так")
            }
        }
    }
    
    func errorCathed(error: String) {
        view?.showError(error: error)
    }
    
    func didSwipeRight() {
        print(#fileID, #function)
        
        router.popBack()
    }
}

// MARK: Extension - QRScannerInteractorToPresenterProtocol
extension QRScannerPresenter: QRScannerInteractorOutput {
    
}
