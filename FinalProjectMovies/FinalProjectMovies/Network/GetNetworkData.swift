//
//  GetNetworkData.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 15.09.2023.
//

import UIKit
import Alamofire

class GetNetworkData {
    
    static let shered = GetNetworkData()
    private init() {}
    
    //MARK: Get Trending Movies Day
    
    func getTrendingMoviesDay(completion: @escaping (Result<[TopMovies], Error>) -> Void) {
        let urlMovies = Constant.network.baseUrlMovie + "trending/movie/day" + Constant.network.apiKey
        
        AF.request(urlMovies).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let movie = try decoder.decode(ModelTopMovies.self, from: data)
                        completion(.success(movie.results))
                        print("Працює Топ Фільми!")
                        return
                    } catch {
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    //MARK: Get Trending TV Day
    func getTrendingTvDay(completion: @escaping (Result<[TopTv], Error>) -> Void) {
        let urlTv = Constant.network.baseUrlMovie + "trending/tv/day" + Constant.network.apiKey
        
        AF.request(urlTv).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let tv = try decoder.decode(ModelTopTv.self, from: data)
                        completion(.success(tv.results))
                        print("Працює ТВ Шоу!")
                        return
                    } catch {
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    //MARK: Get All Movies Day
    
    func getGenresMovies(completion: @escaping (Result<[Genres], Error>) -> Void) {
        let urlGenres = Constant.network.baseUrlMovie + "genre/movie/list" + Constant.network.apiKey
        
        AF.request(urlGenres).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let genres = try decoder.decode(ModelGenres.self, from: data)
                        completion(.success(genres.genres))
                        print("Працює Жанри !")
                        return
                    } catch {
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func getAllMovies(completion: @escaping (Result<[AllMovies], Error>) -> Void) {
        let urlMovies = Constant.network.baseUrlMovie + "trending/movie/week" + Constant.network.apiKey
        
        AF.request(urlMovies).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let allMovies = try decoder.decode(ModelAllMovies.self, from: data)
                        completion(.success(allMovies.results))
                        print("Працює Всі Фільми!")
                        return
                    } catch {
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
