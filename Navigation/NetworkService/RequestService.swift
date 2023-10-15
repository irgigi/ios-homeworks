//
//  RequestService.swift
//  Navigation


import Foundation

struct Planet: Decodable {

    let orbitalPeriod: String
    
    enum CodingKeys: String, CodingKey {
        
        case orbitalPeriod = "orbital_period"
    }
    
    static func requestPlanets(completion: @escaping (Result<String, Error>) -> Void) {
        let baseURL = "https://swapi.dev/api/planets/1"
        guard let url = URL(string: baseURL) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("ОШИБКА - ",error.localizedDescription)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    print("Успешный запрос")
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let planets = try decoder.decode(Planet.self, from: data)
                            print(planets.orbitalPeriod)
                            completion(.success(planets.orbitalPeriod))
                        } catch {
                            print("Ошибка декодирования \(error.localizedDescription)")
                            completion(.failure(error))
                        }
                    }
                case 404:
                    print("Страница не найдена")
                default:
                    print("-", httpResponse.statusCode)
                }
            }
        }
        dataTask.resume()
    }
}




