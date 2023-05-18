import { Application } from "@hotwired/stimulus"
import OrdersController from "./orders_controller"
import Clipboard from 'stimulus-clipboard'
import YookassaController from "./yookassa_controller"

const application = Application.start()
application.register('clipboard', Clipboard)
application.register('yookassa', YookassaController)
console.log("Hello from Stimulus!", application)

application.debug = true
window.Stimulus = application

application.register("orders", OrdersController)

application.handleError = (error, message, detail) => {
  console.warn(message, detail)
  ErrorTrackingSystem.captureException(error)
}

export { application }
