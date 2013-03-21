package pubgulf

import pubgulf.user.Role
import pubgulf.user.User
import pubgulf.user.UserRole

class UserService {

    def springSecurityService

    def createUser(def params) {

        def user = User.findByUsername(params.userName.toString())

        if(user){
            throw new Exception('User Exists')
        } else {
            user = new User(firstName: params.firstName, lastName: params.lastName, username: params.userName,
            passwd: params.password, enabled: true).save(failOnError: true)

            def userRole = UserRole.create(user, Role.findByAuthority('ROLE_USER'), true)
        }

    }
}
