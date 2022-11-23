//
//  HomeTableInteractor.swift
//  swift-example-viper
//
//  Created by Adarsh Sudarsanan on 21/11/22.
//

import Foundation

/// This protocol will be implemented [HomeTableInteractor] and will be used to receive inputs from the presenter.
protocol HomeTableInteractorDelegate: AnyObject {
    func userFetch()
}

class HomeTableInteractor: HomeTableInteractorDelegate {
    
    // MARK: Properties.
    
    // A presenter object that holds a weak reference to the [HomeTableViewListenerDelegate].
    weak var listener: HomeTableListenerDelegate!
    
    // MARK: HomeTableInteractorDelegate.
    
    func userFetch() {
        
        URLSession.shared.request(url: UrlC.users, expecting: [UserEntity].self) { result in
            switch (result) {
            case .failure(let err):
                self.listener.userFetchFailed(error: err)
                break
            case .success(let users):
                self.listener.userFetchSuccess(users: users)
                break
            }
        }
    }
}
