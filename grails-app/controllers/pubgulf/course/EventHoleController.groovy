package pubgulf.course

import org.springframework.dao.DataIntegrityViolationException

class EventHoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [eventHoleInstanceList: EventHole.list(params), eventHoleInstanceTotal: EventHole.count()]
    }

    def create() {
        [eventHoleInstance: new EventHole(params)]
    }

    def save() {
        def eventHoleInstance = new EventHole(params)
        if (!eventHoleInstance.save(flush: true)) {
            render(view: "create", model: [eventHoleInstance: eventHoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'eventHole.label', default: 'EventHole'), eventHoleInstance.id])
        redirect(action: "show", id: eventHoleInstance.id)
    }

    def show(Long id) {
        def eventHoleInstance = EventHole.get(id)
        if (!eventHoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "list")
            return
        }

        [eventHoleInstance: eventHoleInstance]
    }

    def edit(Long id) {
        def eventHoleInstance = EventHole.get(id)
        if (!eventHoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "list")
            return
        }

        [eventHoleInstance: eventHoleInstance]
    }

    def update(Long id, Long version) {
        def eventHoleInstance = EventHole.get(id)
        if (!eventHoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (eventHoleInstance.version > version) {
                eventHoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'eventHole.label', default: 'EventHole')] as Object[],
                        "Another user has updated this EventHole while you were editing")
                render(view: "edit", model: [eventHoleInstance: eventHoleInstance])
                return
            }
        }

        eventHoleInstance.properties = params

        if (!eventHoleInstance.save(flush: true)) {
            render(view: "edit", model: [eventHoleInstance: eventHoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'eventHole.label', default: 'EventHole'), eventHoleInstance.id])
        redirect(action: "show", id: eventHoleInstance.id)
    }

    def delete(Long id) {
        def eventHoleInstance = EventHole.get(id)
        if (!eventHoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "list")
            return
        }

        try {
            eventHoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'eventHole.label', default: 'EventHole'), id])
            redirect(action: "show", id: id)
        }
    }
}
