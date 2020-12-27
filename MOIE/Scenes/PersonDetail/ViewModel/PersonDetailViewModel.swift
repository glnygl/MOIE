//
//  PersonDetailViewModel.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import Foundation
import RxRelay

final class PersonDetailViewModel {
    
    var personId: Int?
    var person = BehaviorRelay<Person?>(value: nil)
    var credits = BehaviorRelay<[Credit]?>(value: nil)
    
    func getPersonDetail() {
        guard let id = personId else { return }
        Service.shared.getPersonDetail(request: PersonDetailRequest(personId: id)) { [weak self] (person) in
            self?.person.accept(person)
        } errorHandler: { (error) in
            print(LocalizableStrings.States.errorState)
        }
    }
    
    func getCredits() {
        guard let id = personId else { return }
        Service.shared.getCredits(request: MovieCreditsRequest(personId: id)) { [weak self] (credits) in
            self?.credits.accept(credits)
        } errorHandler: { (error) in
            print(LocalizableStrings.States.errorState)
        }
    }
    
}
