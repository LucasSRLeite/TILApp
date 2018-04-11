import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

// Conformidade com database sqlite com ID:Int?
extension Acronym: SQLiteModel {}

// Conformidade com Migration para criação da tabela no database
extension Acronym: Migration {}

// Conformidade com Content para permitir conversão dos dados JSON <-> Model
extension Acronym: Content {}
