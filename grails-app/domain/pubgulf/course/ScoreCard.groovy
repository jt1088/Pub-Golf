package pubgulf.course

import pubgulf.user.User

class ScoreCard {

    User user
    Event event

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static hasMany = [holes: HoleScore]

    def totalScore() {
        holes.sum{it.score}
    }

    def holesPlayed(){
        holes.count {it.score > 0}
    }

    def overUnder(){
        Integer par = 0

        def totalScore = totalScore()

        holes.each{
            if(it.score > 0){
                par = par + it.eventHole.par
            }
        }

        totalScore - par
    }

    static mapping = {
        holes sort: 'holeNumber', order: 'asc'
    }
}
