//
//  DetailView.swift
//  Science Bite
//
//  Created by Paris Jackson-Newman on 10/06/2020.
//  Copyright © 2020 Paris Jackson-Newman. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
