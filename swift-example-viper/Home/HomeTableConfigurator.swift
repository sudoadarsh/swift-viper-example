//
//  HomeTableConfigurator.swift
//  swift-example-viper
//
//  Created by Adarsh Sudarsanan on 21/11/22.
//

import Foundation

/// Class used to bind the interactor, presenter, view and router.
class HomeTableConfigurator {
    
    // MARK: - Life cycle.
    
    // Singleton instance of configurator.
    static let instance: HomeTableConfigurator = HomeTableConfigurator()
    
    // MARK: - Methods.
    func configure(viewController: HomeTableViewController) {
        let presenter = HomeTablePresenter()
        viewController.presenter = presenter
        
        let interactor = HomeTableInteractor()
        interactor.listener = presenter
        
        let router = HomeTableRouter()
        viewController.router = router
        
        presenter.interactor = interactor
        presenter.viewDelegate = viewController
        router.vc = viewController
    }
    
    
}
