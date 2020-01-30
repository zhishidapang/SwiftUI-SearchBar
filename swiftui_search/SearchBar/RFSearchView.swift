//
//  RFSearchView.swift
//  swiftui_search
//
//  Created by cf on 2020/1/30.
//  Copyright © 2020 cf. All rights reserved.
//

import SwiftUI

struct SearchBarTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height:40)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .border(Color.gray,width:4)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 4))
    }
}
struct SearchBarButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height:40)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .border(Color.blue,width: 4)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
    }
}


struct RFSearchView: View {
    @State var searchStr:String = ""
    @State private var items: [String] = Array(0...24).map { "Item \($0)" }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    TextField("Search",text: $searchStr)
                        .modifier(SearchBarTextModifier())
                    
                    
                    Button(action:{
                        print(self.searchStr)
                    }){
                        Text("Search")
                        
                    }
                    .modifier(SearchBarButtonModifier())
                    
                }
                List{
                    ForEach(items,id: \.self){ item in
                        Text(item)
                        
                    }
                }
            }
            .navigationBarTitle("Search ")
        }
    }
}

struct RFSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RFSearchView()
    }
}
