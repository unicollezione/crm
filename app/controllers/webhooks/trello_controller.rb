# frozen_string_literal: true

module Webhooks
  # class Webhooks::TrelloController
  #
  # example of a webhook payload:
  #
  # {
  #   "model":{
  #     "id":"6462b26683ab13f9cfb4e761",
  #     "badges":{
  #       "attachmentsByType":{
  #         "trello":{
  #           "board":0,
  #           "card":0
  #         }
  #       },
  #       "location":false,
  #       "votes":0,
  #       "viewingMemberVoted":false,
  #       "subscribed":false,
  #       "fogbugz":"",
  #       "checkItems":0,
  #       "checkItemsChecked":0,
  #       "checkItemsEarliestDue":null,
  #       "comments":0,
  #       "attachments":1,
  #       "description":false,
  #       "due":null,
  #       "dueComplete":false,
  #       "start":null
  #     },
  #     "checkItemStates":[

  #     ],
  #     "closed":false,
  #     "dueComplete":false,
  #     "dateLastActivity":"2023-05-16T14:48:48.918Z",
  #     "desc":"",
  #     "descData":{
  #       "emoji":{

  #       }
  #     },
  #     "due":null,
  #     "dueReminder":null,
  #     "email":null,
  #     "idBoard":"5e79fdeb03111b063f1a19ac",
  #     "idChecklists":[

  #     ],
  #     "idList":"5e79fdf2da6c677826d81873",
  #     "idMembers":[

  #     ],
  #     "idMembersVoted":[

  #     ],
  #     "idShort":125,
  #     "idAttachmentCover":"6462b267b87abcc5201e7a49",
  #     "labels":[

  #     ],
  #     "idLabels":[

  #     ],
  #     "manualCoverAttachment":false,
  #     "name":"#140",
  #     "pos":49152,
  #     "shortLink":"N4H1Uyys",
  #     "shortUrl":"https://trello.com/c/N4H1Uyys",
  #     "start":null,
  #     "subscribed":false,
  #     "url":"https://trello.com/c/N4H1Uyys/125-140",
  #     "cover":{
  #       "idAttachment":"6462b267b87abcc5201e7a49",
  #       "color":null,
  #       "idUploadedBackground":null,
  #       "size":"normal",
  #       "brightness":"dark",
  #       "scaled":[
  #         {
  #           "_id":"6462b268b87abcc5201e7a61",
  #           "id":"6462b268b87abcc5201e7a61",
  #           "scaled":false,
  #           "url":"https://trello.com/1/c",
  #           "bytes":634,
  #           "height":50,
  #           "width":70
  #         },
  #         {
  #           "_id":"6462b268b87abcc5201e7a63",
  #           "id":"6462b268b87abcc5201e7a63",
  #           "scaled":true,
  #           "url":"https://trello.com/1/c",
  #           "bytes":1651,
  #           "height":212,
  #           "width":150
  #         },
  #         {
  #           "_id":"6462b268b87abcc5201e7a62",
  #           "id":"6462b268b87abcc5201e7a62",
  #           "scaled":false,
  #           "url":"https://trello.com/1/c",
  #           "bytes":1590,
  #           "height":150,
  #           "width":250
  #         },
  #         {
  #           "_id":"6462b268b87abcc5201e7a64",
  #           "id":"6462b268b87abcc5201e7a64",
  #           "scaled":true,
  #           "url":"https://trello.com/1/c",
  #           "bytes":5145,
  #           "height":425,
  #           "width":300
  #         },
  #         {
  #           "_id":"6462b268b87abcc5201e7a65",
  #           "id":"6462b268b87abcc5201e7a65",
  #           "scaled":true,
  #           "url":"https://trello.com/1/c",
  #           "bytes":14999,
  #           "height":842,
  #           "width":595
  #         },
  #         {
  #           "_id":"6462b268b87abcc5201e7a66",
  #           "id":"6462b268b87abcc5201e7a66",
  #           "scaled":true,
  #           "url":"https://trello.com/1/cards/6462",
  #           "bytes":14968,
  #           "height":842,
  #           "width":595
  #         }
  #       ],
  #       "edgeColor":"#fcfcfc",
  #       "idPlugin":null
  #     },
  #     "isTemplate":false,
  #     "cardRole":null
  #   },
  #   "action":"create",
  #   "controller":"webhooks/trello",
  #   "trello":{
  #     "model":{
  #       "id":"6462b26683ab13f9cfb4e761",
  #       "badges":{
  #         "attachmentsByType":{
  #           "trello":{
  #             "board":0,
  #             "card":0
  #           }
  #         },
  #         "location":false,
  #         "votes":0,
  #         "viewingMemberVoted":false,
  #         "subscribed":false,
  #         "fogbugz":"",
  #         "checkItems":0,
  #         "checkItemsChecked":0,
  #         "checkItemsEarliestDue":null,
  #         "comments":0,
  #         "attachments":1,
  #         "description":false,
  #         "due":null,
  #         "dueComplete":false,
  #         "start":null
  #       },
  #       "checkItemStates":[

  #       ],
  #       "closed":false,
  #       "dueComplete":false,
  #       "dateLastActivity":"2023-05-16T14:48:48.918Z",
  #       "desc":"",
  #       "descData":{
  #         "emoji":{

  #         }
  #       },
  #       "due":null,
  #       "dueReminder":null,
  #       "email":null,
  #       "idBoard":"5e79fdeb03111b063f1a19ac",
  #       "idChecklists":[

  #       ],
  #       "idList":"5e79fdf2da6c677826d81873",
  #       "idMembers":[

  #       ],
  #       "idMembersVoted":[

  #       ],
  #       "idShort":125,
  #       "idAttachmentCover":"6462b267b87abcc5201e7a49",
  #       "labels":[

  #       ],
  #       "idLabels":[

  #       ],
  #       "manualCoverAttachment":false,
  #       "name":"#140",
  #       "pos":49152,
  #       "shortLink":"N4H1Uyys",
  #       "shortUrl":"https://trello.com/c/N4H1Uyys",
  #       "start":null,
  #       "subscribed":false,
  #       "url":"https://trello.com/c/N4H1Uyys/125-140",
  #       "cover":{
  #         "idAttachment":"6462b267b87abcc5201e7a49",
  #         "color":null,
  #         "idUploadedBackground":null,
  #         "size":"normal",
  #         "brightness":"dark",
  #         "scaled":[
  #           {
  #             "_id":"6462b268b87abcc5201e7a61",
  #             "id":"6462b268b87abcc5201e7a61",
  #             "scaled":false,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":634,
  #             "height":50,
  #             "width":70
  #           },
  #           {
  #             "_id":"6462b268b87abcc5201e7a63",
  #             "id":"6462b268b87abcc5201e7a63",
  #             "scaled":true,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":1651,
  #             "height":212,
  #             "width":150
  #           },
  #           {
  #             "_id":"6462b268b87abcc5201e7a62",
  #             "id":"6462b268b87abcc5201e7a62",
  #             "scaled":false,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":1590,
  #             "height":150,
  #             "width":250
  #           },
  #           {
  #             "_id":"6462b268b87abcc5201e7a64",
  #             "id":"6462b268b87abcc5201e7a64",
  #             "scaled":true,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":5145,
  #             "height":425,
  #             "width":300
  #           },
  #           {
  #             "_id":"6462b268b87abcc5201e7a65",
  #             "id":"6462b268b87abcc5201e7a65",
  #             "scaled":true,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":14999,
  #             "height":842,
  #             "width":595
  #           },
  #           {
  #             "_id":"6462b268b87abcc5201e7a66",
  #             "id":"6462b268b87abcc5201e7a66",
  #             "scaled":true,
  #             "url":"https://trello.com/1/cards/64",
  #             "bytes":14968,
  #             "height":842,
  #             "width":595
  #           }
  #         ],
  #         "edgeColor":"#fcfcfc",
  #         "idPlugin":null
  #       },
  #       "isTemplate":false,
  #       "cardRole":null
  #     },
  #     "action":{
  #       "id":"646397d0685c35106637a466",
  #       "idMemberCreator":"511785eddcfcb0fb7e001fdd",
  #       "data":{
  #         "card":{
  #           "idList":"5e79fdf2da6c677826d81873",
  #           "id":"6462b26683ab13f9cfb4e761",
  #           "name":"#140",
  #           "idShort":125,
  #           "shortLink":"N4H1Uyys"
  #         },
  #         "old":{
  #           "idList":"5e79fdf8a211241bb441c80c"
  #         },
  #         "board":{
  #           "id":"5e79fdeb03111b063f1a19ac",
  #           "name":"B68",
  #           "shortLink":"sibmbfJO"
  #         },
  #         "listBefore":{
  #           "id":"5e79fdf8a211241bb441c80c",
  #           "name":"В Работе"
  #         },
  #         "listAfter":{
  #           "id":"5e79fdf2da6c677826d81873",
  #           "name":"очередь"
  #         }
  #       },
  #       "appCreator":null,
  #       "type":"updateCard",
  #       "date":"2023-05-16T14:48:48.896Z",
  #       "limits":null,
  #       "display":{
  #         "translationKey":"action_move_card_from_list_to_list",
  #         "entities":{
  #           "card":{
  #             "type":"card",
  #             "idList":"5e79fdf2da6c677826d81873",
  #             "id":"6462b26683ab13f9cfb4e761",
  #             "shortLink":"N4H1Uyys",
  #             "text":"#140"
  #           },
  #           "listBefore":{
  #             "type":"list",
  #             "id":"5e79fdf8a211241bb441c80c",
  #             "text":"В Работе"
  #           },
  #           "listAfter":{
  #             "type":"list",
  #             "id":"5e79fdf2da6",
  #             "text":"очередь"
  #           },
  #           "memberCreator":{
  #             "type":"member",
  #             "id":"511785eddcf",
  #             "username":"alxekb",
  #             "text":"Alx Ekb"
  #           }
  #         }
  #       },
  #       "memberCreator":{
  #         "id":"511785eddcfcb0f",
  #         "activityBlocked":false,
  #         "avatarHash":"e0967cf29372d31125f6ef3914b61eb6",
  #         "avatarUrl":"https://trello-members.s3.amazonaws.com/511/e0967cf2",
  #         "fullName":"Alx Ekb",
  #         "idMemberReferrer":null,
  #         "initials":"AE",
  #         "nonPublic":{

  #         },
  #         "nonPublicAvailable":true,
  #         "username":"alxekb"
  #       }
  #     }
  #   }
  # }
  #
  #  params[:trello][:action] => #<ActionController::Parameters
  #  {"id"=>"646397d0685c35106637a466", "idMemberCreator"=>"511785eddcfcb0fb7e001fdd", "data"=>#<ActionController::Parameters {"card"=>{"idList"=>"5e79fdf2da6c677826d81873", "id"=>"6462b26683ab13f9cfb4e761", "name"=>"#140", "idShort"=>125, "shortLink"=>"N4H1Uyys"}, "old"=>{"idList"=>"5e79fdf8a211241bb441c80c"}, "board"=>{"id"=>"5e79fdeb03111b063f1a19ac", "name"=>"B68", "shortLink"=>"sibmbfJO"}, "listBefore"=>{"id"=>"5e79fdf8a211241bb441c80c", "name"=>"В Работе"}, "listAfter"=>#<ActionController::Parameters {"id"=>"5e79fdf2da6c677826d81873", "name"=>"очередь"} permitted: false>} permitted: false>, "appCreator"=>nil, "type"=>"updateCard", "date"=>"2023-05-16T14:48:48.896Z", "limits"=>nil, "display"=>{"translationKey"=>"action_move_card_from_list_to_list", "entities"=>{"card"=>{"type"=>"card", "idList"=>"5e79fdf2da6c677826d81873", "id"=>"6462b26683ab13f9cfb4e761", "shortLink"=>"N4H1Uyys", "text"=>"#140"}, "listBefore"=>{"type"=>"list", "id"=>"5e79fdf8a211241bb441c80c", "text"=>"В Работе"}, "listAfter"=>{"type"=>"list", "id"=>"5e79fdf2da6c677826d81873", "text"=>"очередь"}, "memberCreator"=>{"type"=>"member", "id"=>"511785eddcfcb0fb7e001fdd", "username"=>"alxekb", "text"=>"Alx Ekb"}}}, "memberCreator"=>{"id"=>"511785eddcfcb0fb7e001fdd", "activityBlocked"=>false, "avatarHash"=>"e0967cf29372d31125f6ef3914b61eb6", "avatarUrl"=>"https://trello-members.s3.amazonaws.com/511785eddcfcb0fb7e001fdd/e0967cf29372d31125f6ef3914b61eb6", "fullName"=>"Alx Ekb", "idMemberReferrer"=>nil, "initials"=>"AE", "nonPublic"=>{}, "nonPublicAvailable"=>true, "username"=>"alxekb"}} permitted: false> # rubocop:disable Layout/LineLength
  class TrelloController < ApplicationController
    skip_before_action :authenticate_user!, :verify_authenticity_token

    def create
      Order.find_by(trello_card_id:)
           .order_events
           .create!(event_source: :notification, body: trello_webhook_payload)

      render json: { status: :ok }
    end

    def index
      @order = Order.find_by(trello_card_id: params[:path])

      @order && @order.order_events.create!(event_source: :notification, body: created_payload)

      render json: { status: 'ok' }
    end

    private

    def created_payload
      {
        action_type: :created,
        card_name: @order.idx,
        creator: :notification,
        list_before: :none,
        list_after: :created
      }
    end

    def trello_webhook_payload
      { action_type:, card_name:, creator:, list_before:, list_after:, payload: params[:trello][:action] }
    end

    def trello_card_id
      params[:trello][:action][:data][:card][:id]
    end

    # 'updateCard'
    def action_type
      params[:trello][:action][:type]
    end

    # '#140'
    def card_name
      params[:trello][:action][:data][:card][:name]
    end

    # 'alxekb'
    def creator
      params[:trello][:action][:memberCreator][:username]
    end

    # 'очередь'
    def list_after
      params[:trello][:action][:data][:listAfter][:name]
    end

    # 'В Работе'
    def list_before
      params[:trello][:action][:data][:listBefore][:name]
    end
  end
end
