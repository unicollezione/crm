import "@hotwired/turbo-rails"
import './controllers'
import "@hotwired/turbo-rails"
import { application } from './controllers'
import { initChoices } from './utils'

initChoices()

export { application }
