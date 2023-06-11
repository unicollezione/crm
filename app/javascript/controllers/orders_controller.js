import Choices from "choices.js"
import { Controller } from "@hotwired/stimulus"

import { choicesConfig } from "../utils"

export default class extends Controller {
  static targets = [ "product", "customer", "fabric" ]

  fabricTargetConnected() {
    if (this.element.dataset.choice !== 'active') {
      new Choices(this.element, choicesConfig).setValue([])
    }
  }

  customerTargetConnected() {
    if (this.element.dataset.choice !== 'active') {
      new Choices(this.element, choicesConfig).setValue([])
    }
  }

  productTargetConnected() {
    if (this.element.dataset.choice !== 'active') {
      new Choices(this.element, choicesConfig).setValue([])
    }

  }
}
