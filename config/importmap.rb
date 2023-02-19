# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin 'jquery', to: 'https://ga.jspm.io/npm:jquery@3.6.3/dist/jquery.js', preload: true
pin 'utils'
pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js'
pin "select2", to: "https://ga.jspm.io/npm:select2@4.1.0-rc.0/dist/js/select2.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.3/dist/jquery.js"
