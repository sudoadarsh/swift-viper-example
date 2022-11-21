//
//  HomeTablePresenter.swift
//  swift-example-viper
//
//  Created by Adarsh Sudarsanan on 21/11/22.
//

import Foundation

/// This protocol will be implemented by [HomeTablePresenter] and will be used to receive inputs from the [HomeTableViewController].

protocol HomeTablePresenterDelegate: AnyObject {
    func getUsers()
}

/// This protocol will be implemented by [HomeTablePresenter] and will be used to receive inputs from the [HomeTableInteractor].

protocol HomeTableListenerDelegate: AnyObject {
    func userFetchSuccess(users: [UserEntity])
    func userFetchFailed(error: Error)
}

class HomeTablePresenter: HomeTablePresenterDelegate {
    
    // MARK: - Properties.
    
    // An interactor object holding a reference of [HomeTableInteractorDelegate].
    var interactor: HomeTableInteractorDelegate!
    
    // An viewDelegate object holding a weak reference of [HomeTableViewController].
    weak var viewDelegate: HomeTableViewDelegate!
    
    // MARK: - HomeTablePresenterDelegate.
    
    func getUsers() {
        self.interactor.userFetch()
    }
}

extension HomeTablePresenter: HomeTableListenerDelegate {
    
    // MARK: - HomeTableListenerDelegate.
    
    func userFetchSuccess(users: [UserEntity]) {
        viewDelegate.displayUsers(users: users)
    }
    
    func userFetchFailed(error: Error) {
        viewDelegate.displayError(error: error)
    }
    
}
