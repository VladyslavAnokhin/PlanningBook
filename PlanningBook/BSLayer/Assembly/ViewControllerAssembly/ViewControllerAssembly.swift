//
//  ViewControllerAssembly.swift
//  PlanningBook
//
//  Created by Vladyslav Anokhin on 3/2/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import Foundation
import Typhoon

class HistoryModuleAssembly: TyphoonAssembly{
    
    var storyboardAssembly: StoryboardAssebmly!
    var emptyTableViewAssembly: EmptyTableViewDelegateAssembly!
    
    public dynamic func setupHistoryController() -> Any {
        return TyphoonDefinition.withClass(HistoryNotesViewCotnroller.self, configuration: { (definition) in
            definition?.injectProperty(#selector(getter: HistoryNotesViewCotnroller.emptyDelagateDataSource),
                                       with: self.emptyTableViewAssembly.historyEmptyViewDelegate())
        })
    }
    
    public dynamic func historyViewController() -> Any {
        return TyphoonDefinition.withFactory(storyboardAssembly.mainStoryboard(),
                                             selector: #selector(UIStoryboard.instantiateViewController(withIdentifier:)),
                                             parameters: { (factoryMethod) in
                                                factoryMethod?.injectParameter(with: "HistoryNotesViewCotnroller")
        })
    }
    

}

class TodayModuleAssembly: TyphoonAssembly{
    
    var storyboardAssembly: StoryboardAssebmly!
    var emptyTableViewAssembly: EmptyTableViewDelegateAssembly!
    
    public dynamic func setupTodayController() -> Any {
        return TyphoonDefinition.withClass(TodayNoteViewController.self, configuration: { (definition) in
            definition?.injectProperty(#selector(getter: TodayNoteViewController.emptyDelagateDataSource),
                                       with: self.emptyTableViewAssembly.todayPlansEmptyViewDelegate())
        })
    }
    
    public dynamic func todayNoteViewController() -> Any {
        return TyphoonDefinition.withFactory(storyboardAssembly.mainStoryboard(),
                                             selector: #selector(UIStoryboard.instantiateViewController(withIdentifier:)),
                                             parameters: { (factoryMethod) in
                                                factoryMethod?.injectParameter(with: "TodayNoteViewController")
                                                
        })
    }
}

class EmptyTableViewDelegateAssembly: TyphoonAssembly{
    
    public dynamic func todayPlansEmptyViewDelegate() -> Any {
        return TyphoonDefinition.withClass(EmptyViewDataSourceDelegate.self, configuration: { (definition) in
            definition?.useInitializer(#selector(EmptyViewDataSourceDelegate.init(title:buttonTitle:)),
                                       parameters: { initializer in
                                        initializer?.injectParameter(with: "Today you haven't any plans")
                                        initializer?.injectParameter(with: "Add plans!")
                })
        })
    }
    
    public dynamic func historyEmptyViewDelegate() -> Any {
        return TyphoonDefinition.withClass(EmptyViewDataSourceDelegate.self, configuration: { (definition) in
            definition?.useInitializer(#selector(EmptyViewDataSourceDelegate.init(title:buttonTitle:)),
                                       parameters: { initializer in
                                        initializer?.injectParameter(with: "You don't add any plans")
                                        initializer?.injectParameter(with: "Create new one")
            })
        })
    }
    
}
