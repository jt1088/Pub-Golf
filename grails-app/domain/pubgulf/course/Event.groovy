package pubgulf.course



class Event {

    String name
    Date eventDate
    Boolean isActive = true

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false
        eventDate nullable: false
        lastUpdated nullable: true
        dateCreated nullable: true
    }

    static hasMany = [holes: EventHole, teams: EventTeam ]

    String  toString(){
        name
    }

    static mapping = {
        holes sort: 'holeNumber', order: 'asc'
    }
}
