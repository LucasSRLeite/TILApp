import Vapor
import FluentPostgreSQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

// Conformidade com database com ID:Int?
extension Acronym: PostgreSQLModel {}

// Conformidade com Migration para criação da tabela no database
extension Acronym: Migration {}

// Conformidade com Content para permitir conversão dos dados JSON <-> Model com .encode() e .decode()
extension Acronym: Content {}

extension Acronym: Parameter {}
