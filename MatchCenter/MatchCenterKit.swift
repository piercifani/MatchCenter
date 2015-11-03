import Foundation

public struct Match {
    public let homeTeam : Team
    public let visitorTeam : Team
    
    public var homeTeamGoals : [Goal]
    public var visitorTeamGoals : [Goal]
}

public struct Team {
    public let name : String
    public let players : [Player]
    public let badgeName : String
}

public struct Player {
    public let name : String
    public let number : Int
}

public struct Goal {
    public let scorer : Player
    public let minute : Int
    public let description : String
}

public func match1() -> Match {
    //Madrid Team
    let realMadrid: Team = {
        let iker    = Player(name: "Casillas", number: 1)
        let marcelo = Player(name: "Marcelo", number: 12)
        let pepe    = Player(name: "Pepe", number: 3)
        let ramos   = Player(name: "Ramos", number: 2)
        let carvajal = Player(name: "Carvajal", number: 13)
        let james   = Player(name: "James", number: 10)
        let modric  = Player(name: "Modric", number: 19)
        let isco    = Player(name: "Isco", number: 23)
        let bale    = Player(name: "Bale", number: 11)
        let benzema = Player(name: "Benzema", number: 9)
        let CR7     = Player(name: "CR7", number: 7)
        return Team(name:"Real Madrid", players: [iker, marcelo, pepe, ramos, carvajal, james, modric, isco, bale, benzema, CR7], badgeName: "real_madrid_logo")
    }()
    
    let barça: Team = {
        let bravo       = Player(name: "Bravo", number: 13)
        let jordialba   = Player(name: "jordiAlba", number: 12)
        let pique       = Player(name: "Pique", number: 3)
        let mascherano  = Player(name: "Mascherano", number: 14)
        let alves       = Player(name: "Alves", number: 22)
        let iniesta     = Player(name: "Iniesta", number: 8)
        let rakitic     = Player(name: "Rakitic", number: 4)
        let busquets    = Player(name: "Sergio Busquets", number: 5)
        let messi       = Player(name: "Messi", number: 10)
        let neymar      = Player(name: "Neymar", number: 11)
        let suarez      = Player(name: "Suarez", number: 9)
        
        return Team(name:"FC Barcelona", players: [bravo, jordialba, pique, mascherano, alves, iniesta, rakitic, busquets, messi, neymar, suarez], badgeName: "fc_barcelona_logo")
    }()
    
    let iniestaGol : Goal = {
        return Goal(scorer: barça.players[5], minute: 20, description: "de cabeza luego de un centro por la derecha")
    }()
    
    let cr7Gol : Goal = {
        return Goal(scorer: realMadrid.players[10], minute: 88, description: "de penalty")
    }()
    
    return Match(homeTeam: barça, visitorTeam: realMadrid, homeTeamGoals: [iniestaGol], visitorTeamGoals: [cr7Gol])
}

public func match2() -> Match {
    let atleticoMadrid: Team = {
        let griezmann = Player(name: "Griezmann", number: 7)
        return Team(name:"Atlético Madrid", players: [griezmann], badgeName: "atletico_madrid_logo")
    }()
    
    let valencia: Team = {
        let pacoAlcacer = Player(name: "Paco Alcácer", number: 9)
        return Team(name:"Valencia FC", players: [pacoAlcacer], badgeName: "valencia_logo")
    }()
    
    let alcacerGoal : Goal = {
        return Goal(scorer: atleticoMadrid.players[0], minute: 20, description: "con la zurda tras jugada individual")
    }()

    let pacoAlacerGoal : Goal = {
        return Goal(scorer: valencia.players[0], minute: 23, description: "remate desde fuera")
    }()

    let pacoAlacerGoal2 : Goal = {
        return Goal(scorer: valencia.players[0], minute: 88, description: "de falta directa")
    }()
    
    return Match(homeTeam: valencia, visitorTeam: atleticoMadrid, homeTeamGoals: [alcacerGoal], visitorTeamGoals: [pacoAlacerGoal, pacoAlacerGoal2])
}

public func match3() -> Match {
    let depor: Team = {
        return Team(name:"Deportivo La Coruña", players: [], badgeName: "depor_logo")
    }()
    
    let numancia: Team = {
        return Team(name:"Numancia", players: [], badgeName: "numancia_logo")
    }()
    
    return Match(homeTeam: depor, visitorTeam: numancia, homeTeamGoals: [], visitorTeamGoals: [])
}

public func match4() -> Match {
    let español: Team = {
        let MarcoAsensio = Player(name: "Marco Asensio", number: 7)
        return Team(name:"Espanyol", players: [MarcoAsensio], badgeName: "espanyol_logo")
    }()
    
    let athleticBilbao: Team = {
        let williams = Player(name: "Iñaki Williams", number: 7)
        return Team(name:"Athletic Bilbao", players: [williams], badgeName: "bilbao_logo")
    }()
    
    let williamsGol : Goal = {
        return Goal(scorer: athleticBilbao.players[0], minute: 29, description: "tras jugada individual")
    }()

    return Match(homeTeam: athleticBilbao, visitorTeam: español, homeTeamGoals: [williamsGol], visitorTeamGoals: [])
}

func undefined<T>(hint:String="", file:StaticString=__FILE__, line:UInt=__LINE__) -> T {
    let message = hint == "" ? "" : ": \(hint)"
    fatalError("undefined \(T.self)\(message)", file:file, line:line)
}