//
//  PersonDetailViewController.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

final class PersonDetailViewController: BaseViewController {
    
    let viewModel = PersonDetailViewModel()

    @IBOutlet var personDetailView: PersonDetailView!
    override func viewDidLoad() {
        super.viewDidLoad()
        observeValues()
        navigationItem.title = "Person Detail"
        viewModel.getPersonDetail()
        viewModel.getCredits()
    }
    
    func observeValues() {
        viewModel.person.asObservable().subscribe { [weak self] (_) in
            guard let person = self?.viewModel.person.value else { return }
            self?.personDetailView.person.accept(person)
        }.disposed(by: Service.shared.disposeBag)
        viewModel.credits.asObservable().subscribe { [weak self] (_) in
            guard let credits = self?.viewModel.credits.value else { return }
            self?.personDetailView.credits.accept(credits)
        }.disposed(by: Service.shared.disposeBag)
        
    }
    
}
