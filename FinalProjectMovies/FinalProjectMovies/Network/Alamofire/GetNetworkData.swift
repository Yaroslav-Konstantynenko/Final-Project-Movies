//
//  GetNetworkData.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 15.09.2023.
//

import UIKit
import Alamofire
import SystemConfiguration

class GetNetworkData {
    
    static let shered = GetNetworkData()
    private init() {}
    
    
    func isInternetAvailable() -> Bool {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)

            guard let reachability = withUnsafePointer(to: &zeroAddress, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }) else {
                return false
            }

            var flags: SCNetworkReachabilityFlags = []
            if !SCNetworkReachabilityGetFlags(reachability, &flags) {
                return false
            }

            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)

            return isReachable && !needsConnection
        }
    
    //MARK: Get Trending Movies Day
    
    func getTrendingMoviesDay(completion: @escaping (Result<[TopMovies], Error>) -> Void) {
        let urlMovies = Constant.network.baseUrlMovie + Constant.network.popularMoviDay + Constant.network.language
        
        AF.request(urlMovies, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
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
        let urlTv = Constant.network.baseUrlMovie + Constant.network.popularTvDay + Constant.network.language
        
        AF.request(urlTv, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
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
        let urlGenres = Constant.network.baseUrlMovie + "genre/movie/list" + Constant.network.language
        
        AF.request(urlGenres, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
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
    
    //MARK: Get All Movies
    func getAllMovies(completion: @escaping (Result<[AllMovies], Error>) -> Void) {
        let urlMovies = Constant.network.baseUrlMovie + "trending/movie/week" + Constant.network.language
        
        AF.request(urlMovies, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
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
    
    //MARK: Get All TV
    func getAllTv(completion: @escaping (Result<[TvWeek], Error>) -> Void) {
        let urlTvWeek = Constant.network.baseUrlMovie + "trending/tv/week" + Constant.network.language
        
        AF.request(urlTvWeek, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let tvWeek = try decoder.decode(ModelTvWeek.self, from: data)
                        completion(.success(tvWeek.results))
                        print("Працює Всі Tv!")
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
    
    //MARK: Get load Movie Video
    func getLoadVideoMovie(movieId: Int, type: String, completion: @escaping (Result<[MovieVideo], Error>) -> Void) {
        let urlVideo = "\(Constant.network.baseUrlMovie)" + "\(type)/\(movieId)/videos" + "\(Constant.network.language)"
        
        AF.request(urlVideo, method: .get, parameters: Constant.network.apiKey).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                
                if let data = response.data {
                    do {
                        let video = try decoder.decode(ModelVideoMovie.self, from: data)
                        completion(.success(video.videos))
                        print("Працює Video Kay!")
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
