package pubgulf.user

class User {

    transient springSecurityService

    String username
    String passwd
    String firstName
    String lastName
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        firstName nullable: true
        lastName nullable: true
        passwd blank: false
    }

    static mapping = {
        table 'user_table'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('passwd')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        passwd = springSecurityService.encodePassword(passwd)
    }

}
