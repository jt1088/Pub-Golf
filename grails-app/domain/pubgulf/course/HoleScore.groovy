package pubgulf.course


class HoleScore {

    EventHole eventHole
    Integer score = 0
    Integer holeNumber

    Date dateCreated
    Date lastUpdated

    static constraints = {

    }

    static belongsTo = [scoreCard: ScoreCard]

    //hack for sorting
    void setEventHole(EventHole eventHole1){
        this.eventHole = eventHole1
        holeNumber = eventHole1.holeNumber
    }
}
