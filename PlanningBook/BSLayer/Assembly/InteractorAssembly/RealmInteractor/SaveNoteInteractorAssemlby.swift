//
//  RealmSaveNoteInteractorAssemlby.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/5/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon

class SaveNoteInteractorAssemlby: TyphoonAssembly{
    
    public dynamic func realmSaveNoteInteractor() -> Any {
        return TyphoonDefinition.withClass( RealmSaveNoteInteractor.self )
    }
}
