//
//  MnueViewVM.swift
//  XNoteMac
//
//  Created by 许莉鑫 on 2020/7/19.
//  Copyright © 2020 许莉鑫. All rights reserved.
//

import Cocoa

class MenuViewVM {
    static func getMenuListData() -> Array<MenuViewModel> {
        let model1 = MenuViewModel()
        let model2 = MenuViewModel()
        model1.title = """
        static func getMenuListData() -> Array<MenuViewModel> {
        let model1 = MenuViewModel()
        let model2 = MenuViewModel()
        model2.title = "desc2"
        return [model1, model2]
        //
        //  MnueViewVM.swift
        //  XNoteMac
        //
        //  Created by 许莉鑫 on 2020/7/19.
        //  Copyright © 2020 许莉鑫. All rights reserved.
        //
        """
        model2.title = "desc2"
        return [model1, model2]
    }
}
