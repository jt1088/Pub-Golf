package pubgulf.course

import pubgulf.AbstractDomainClass

class Event extends AbstractDomainClass{

    String name
    Date eventDate

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
