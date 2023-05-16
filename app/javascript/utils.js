import Choices from 'choices.js'

const choicesConfig = {
  searchEnabled: true,
  allowHTML: false
}
const elements = [
  'product_id',
  'fabric_id',
  'workroom_id',
  'customer_id'
]

const events = ['DOMContentLoaded', 'turbo:frame-load']

const initChoices = () => {
  events.forEach((domEvent) => {
    document.addEventListener(domEvent, () => {

      elements.forEach((element) => {
        let select = document.getElementById(element)

        if (select) {
          new Choices(select, choicesConfig).setValue([])
        } else {
          console.log(`Element ${element} not found`)
        }
      })
    })
  })
}

export { initChoices }
