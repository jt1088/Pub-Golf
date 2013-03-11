package pubgulf

class Pub extends AbstractDomainClass {

    String name
    Address address

    static constraints = {
        name nullable: false
        address nullable: false
    }

    String toString(){
        name
    }

}
