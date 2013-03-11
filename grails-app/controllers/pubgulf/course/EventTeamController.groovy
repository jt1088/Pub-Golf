package pubgulf.course

import org.springframework.dao.DataIntegrityViolationException

class EventTeamController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventTeamInstanceList: EventTeam.list(params), eventTeamInstanceTotal: EventTeam.count()]
    }

    def create() {
        switch (request.method) {
            case 'GET':
                [eventTeamInstance: new EventTeam(params)]
                break
            case 'POST':
                def eventTeamInstance = new EventTeam(params)
                if (!eventTeamInstance.save(flush: true)) {
                    render view: 'create', model: [eventTeamInstance: eventTeamInstance]
                    return
                }

                flash.message = message(code: 'default.created.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), eventTeamInstance.id])
                redirect action: 'show', id: eventTeamInstance.id
                break
        }
    }

    def show() {
        def eventTeamInstance = EventTeam.get(params.id)
        if (!eventTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
            redirect action: 'list'
            return
        }

        [eventTeamInstance: eventTeamInstance]
    }

    def edit() {
        switch (request.method) {
            case 'GET':
                def eventTeamInstance = EventTeam.get(params.id)
                if (!eventTeamInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
                    redirect action: 'list'
                    return
                }

                [eventTeamInstance: eventTeamInstance]
                break
            case 'POST':
                def eventTeamInstance = EventTeam.get(params.id)
                if (!eventTeamInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (eventTeamInstance.version > version) {
                        eventTeamInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'eventTeam.label', default: 'EventTeam')] as Object[],
                                "Another user has updated this EventTeam while you were editing")
                        render view: 'edit', model: [eventTeamInstance: eventTeamInstance]
                        return
                    }
                }

                eventTeamInstance.properties = params

                if (!eventTeamInstance.save(flush: true)) {
                    render view: 'edit', model: [eventTeamInstance: eventTeamInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), eventTeamInstance.id])
                redirect action: 'show', id: eventTeamInstance.id
                break
        }
    }

    def delete() {
        def eventTeamInstance = EventTeam.get(params.id)
        if (!eventTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
            redirect action: 'list'
            return
        }

        try {
            eventTeamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'eventTeam.label', default: 'EventTeam'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
