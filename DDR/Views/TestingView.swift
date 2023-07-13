//
//  TestingView.swift
//  DDR
//
//  Created by Desi Rorie on 7/7/23.
//

import SwiftUI

struct TestingView: View {
    @State private var isPresented:Bool = false
    @State private var showActionSheet:Bool = false
    
    
    @State var actionSheetOptions:ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
    
    @State private var firstName:String = ""
    @State private var dataArray: [String] = []
    
    func AddText(){
        dataArray.append(firstName)
        firstName = ""
    }
    func checkText() -> Bool {
        if (firstName.count >= 3) {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack {
            
            TextField("Enter your name", text: $firstName)
                .padding(
                ).background(Color.gray).opacity(0.3).cornerRadius(10)
                .foregroundColor(.red)
                .font(.headline)
            Text("Your name is \(firstName)")
                .padding()
                .frame(maxWidth: .infinity)
                .background(checkText() ? Color.blue : Color.gray)
                .cornerRadius(20)
            Button {
                if checkText() {
                    AddText()
                }
            } label: {
                Text("Add the name to the array")
            }.disabled(!checkText())
                
            
            List {
                ForEach(dataArray, id: \.self) { Name in
                    Text("\(Name)")
                }
            }
            
            
            //            HStack{
            //                Circle().frame(width: 30, height: 30)
            //                Text("@username")
            //                Spacer()
            //                Button {
            //                    actionSheetOptions = .isOtherPost
            //                    showActionSheet.toggle()
            //                } label: {
            //                    Image(systemName: "ellipsis")
            //                }.accentColor(.black)
            //
            //
            //            }
            //            .padding(.horizontal)
            //            Rectangle()
            //                .aspectRatio(1.0, contentMode: .fit)
        }
        .accentColor(.orange)
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
        //            return  ActionSheet(title: Text("This is the title"))
        //
        //        let button1: ActionSheet.Button = .default(Text("Default"))
        //        let button2: ActionSheet.Button = .destructive(Text("Destructive"))
        //        let button3:ActionSheet.Button = .cancel()
        //
        //        return ActionSheet(title: Text("This is the title"),
        //                           message: Text("This is the message"),
        //                           buttons: [button1,button2,button3])
        
        
        
        let shareButton:ActionSheet.Button = .default(Text("Share")) {
            
        }
        let reportButton:ActionSheet.Button = .destructive(Text("Report")) {
            //code for the report
        }
        let deleteButton:ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        let cancelButton:ActionSheet.Button = .cancel(){
            
        }
        let title = Text("What would you like to do")
        
        switch actionSheetOptions {
        case .isMyPost:
            return ActionSheet(title: title,
                               message: nil,
                               buttons: [shareButton,reportButton,deleteButton,cancelButton])
            
        case .isOtherPost:
            return ActionSheet(title: title ,
                               message: nil,
                               buttons: [shareButton,reportButton,cancelButton])
        }
        
    }
    
    struct TestingView_Previews: PreviewProvider {
        static var previews: some View {
            TestingView()
        }
    }
}
