package pubgulf.course

import pubgulf.AbstractDomainClass

class HoleScore extends AbstractDomainClass{

    EventHole eventHole
    Integer score = 0
    Integer holeNumber

    static constraints = {

    }

    static belongsTo = [scoreCard: ScoreCard]

    //hack for sorting
    void setEventHole(EventHole eventHole1){
        this.eventHole = eventHole1
        holeNumber = eventHole1.holeNumber
    }
}
