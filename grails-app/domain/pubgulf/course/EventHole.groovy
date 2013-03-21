package pubgulf.course

import pubgulf.Pub

class EventHole {

    Integer holeNumber
    Event event
    Pub pub
    Integer par
    String description
    Boolean hasWaterHazard = false
    Boolean hasBunker = false

    Date dateCreated
    Date lastUpdated

    static constraints = {
        holeNumber nullable: false
        pub nullable: false
        par nullable: false
        description nullable: true
    }

    static mapping = {
        sort(holeNumber: 'desc')
    }

    String toString(){
        "${holeNumber} - ${pub.name}"

    }
}
