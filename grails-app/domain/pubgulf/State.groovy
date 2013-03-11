package pubgulf

/**
 * Created with IntelliJ IDEA.
 * User: jt
 * Date: 2/20/13
 * Time: 9:04 PM
 * To change this template use File | Settings | File Templates.
 */
class State extends AbstractDomainClass{

    String stateCode
    String stateName

    static constraints = {
        stateName(blank:false, nullable:false)
    }

    static mapping = { id column: 'stateCode'}

    String toString() {
        return stateCode
    }
}
