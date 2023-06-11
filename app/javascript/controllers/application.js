import { Application } from "@hotwired/stimulus"
import OrdersController from "./orders_controller"
import Clipboard from 'stimulus-clipboard'
import YookassaController from "./yookassa_controller"

const application = Application.start()

application.register('clipboard', Clipboard)
application.register('yookassa', YookassaController)

if (process.env.NODE_ENV === 'development') {
  application.debug = true
}

window.Stimulus = application

application.register("orders", OrdersController)

application.handleError = (_error, message, detail) => {
  console.warn(message, detail)
}

export { application }
