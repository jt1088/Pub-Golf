package pubgulf

class Pub  {

    String name
    Address address
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false
        address nullable: false
    }

    String toString(){
        name
    }

}
