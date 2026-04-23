//
//  ContentView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                List {
                    topicsSection
                    topListSection
                        .listRowSeparator(.hidden)
                } .listStyle(.grouped)
                
            } .navigationTitle("List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    leadingToolbar
                    trailingToolbar
                }
                .navigationDestination(isPresented: $viewModel.showSearch) {
                    SearchView()
                }
        }
    }
}

extension HomeView {
    
    private var leadingToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                viewModel.showProfile.toggle()
            } label: {
                Image(systemName: "person.fill")
            } .sheet(isPresented: $viewModel.showProfile) {
                ProfileView()
            }
        }
    }
    
    private var trailingToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    print("category tapped")
                } label: {
                    Image(systemName: "square.grid.2x2")
                }
                Button {
                    print("search tapped")
                    viewModel.showSearch.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
    
    private var topicsSection: some View {
        Section {
            ForEach(viewModel.topics) { topic in
                TopicsRow(
                    socialImage: topic.socialImage,
                    topicTitle: topic.topicTitle,
                    topicHours: topic.topicHours
                )
            }
        } header: {
            HStack {
                Text("Topics")
                Spacer()
                Button {
                    
                } label: {
                    HStack {
                        Text("See more")
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 12)
                    }
                }
            }
        }
    }
    
    private var topListSection: some View {
        Section {
            ForEach(viewModel.topList) { item in
                TopListRow(topicItems: item)
            }
        } header: {
            VStack {
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.gray)
                        Button {
                            //
                        } label: {
                            Text("Top 100")
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.gray)
                        
                        Button {
                            //
                        } label: {
                            Text("24h %")
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                }
                
                HStack {
                    Button {
                        //
                    } label: {
                        Text("Asset/M.Cap")
                            .foregroundStyle(.black)
                            .font(.system(size: 11, weight: .regular))
                    }
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("Price")
                            .foregroundStyle(.black)
                            .font(.system(size: 11, weight: .regular))
                    }
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("24h %")
                            .foregroundStyle(.black)
                            .font(.system(size: 11, weight: .regular))
                    }
                }
            } .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabListView()
}
