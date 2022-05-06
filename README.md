# README

### Requirements

`ruby >= 2.7.3`

`rails ~> 6.0.4`

### Installation & using

In `terminal` or `cmd`

- `$ git clone git@github.com:unicollezione/crm.git`

- `$ gem install bundler` - if needed

- `$ bundle install`

The project uses postgresql to work with databases.
If postgresql docker is used, you must take the file config/database.docker.yml.example. 

- `docker-compose up` for run database

If postgresql is installed in the operating system then use config/database.yml.example

- `$ rails db:migrate`

- `rails webpacker:install` for webpacker

- Overwrite `/crm/package.json`? - No

- `$ rails s` for server starting

If ubuntu is used, the package direnv must be installed for the .envrc file

```console
$ sudo apt install direnv
```

Next, [connect](https://github.com/direnv/direnv/blob/master/docs/hook.md) depending on the shell used.

Then allow variables in the project:

```console
$ direnv allow .
```

Then open `http://localhost:3000` at your web-browser

## Setup for staging / production

Connecting staging

```console
heroku run rails console --app <app name>
```

# CRM

Ендпоинты следущие:
  get /api/v1/customers - просмотр всех клиентов
  get /api/v1/customers/{id} - просмотр одного клиента
  post /api/v1/customers - создать клиента
  put /api/v1/customers/{id} - изменить поля клиента
  delete /api/v1/customers/{id} - удалить клиента


  Для рендера pdf страниц

  1. Ставим gem 'prawn'

  2. В config/initializers/mime_types.rb  
     для инициализации pdf прописываем  
     
     Mime::Type.register "application/pdf", :pdf

  3. В эндпоинт show 

        def show  
          @customer  
          respond_to do |format|  
          format.pdf do  
          pdf = Prawn::Document.new  
          pdf.text "Hello World"  
          send_data pdf.render  
          end  
          end  
         end  
        

  4.  Для поддержки respond_to в API в файле customers_controller.rb  прописываем

       class ApplicationController < ActionController::API  
       
         include ActionController::MimeResponds  
         
       end
       
  5.  Путь для render pdf  
  6.  
      http://127.0.0.1:3000/api/v1/customers/1.pdf  
      где 1.pdf номер id 
