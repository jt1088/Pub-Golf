package pubgulf

class Address {
    String address1
    String address2
    String city
    State state
    String zip
    String country
    String latitude
    String longitude

    Date dateCreated
    Date lastUpdated

    static constraints = {
        address1(blank: false, maxLength: 60)
        address2(nullable: true, maxLength: 60)
        city(blank: false, maxLength: 40)
        state(blank: false, maxLength: 40)
        zip(blank: false, maxLength: 20)
        country(nullable: true, maxLength: 60)
        latitude(nullable: true)
        longitude(nullable: true)
    }

    String toString(){
        "${address1} ${address2 ?: address2 + ',' ; ''}, ${city} ${state.stateName}  ${zip}"
    }
}
