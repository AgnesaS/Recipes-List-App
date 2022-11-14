//
//  RecipesFeaturedView.swift
//  Recipes List App
//
//  Created by Agnesa  on 11.11.22.
//

import SwiftUI

struct RecipesFeaturedView: View {
    
    @EnvironmentObject var viewModel: RecipesViewModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            
            GeometryReader{ geo in
                TabView (selection: $tabSelectionIndex){
                    
                    ForEach(0..<viewModel.recipes.count) { index in
                        
                        if viewModel.recipes[index].featured == true {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack{
                                        Image(viewModel.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(viewModel.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing ){
                                
                                RecipesDetailsView(recipes: viewModel.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6), radius: 10, x: -5, y: 5)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation time:")
                    .font(.headline)
                    .bold()
                Text(viewModel.recipes[tabSelectionIndex].prepTime)
                Text("Higlights")
                    .font(.headline)
                    .bold()
                RecipeHighlightsView(highlights: viewModel.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .top])
            
        }
        .onAppear {
            setFeaturedIndex()
        }
    }
    
    func setFeaturedIndex(){
        
        //find the index of first recipe that is featured
        
       var index = viewModel.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipesFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesFeaturedView()
            .environmentObject(RecipesViewModel())
    }
}
