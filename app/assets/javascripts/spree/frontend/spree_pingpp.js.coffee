//= require 'pingpp-pc'
Spree.routes.handle_pingpp = Spree.pathFor('checkout/handle_pingpp')

Spree.ready ($) ->
  Spree.onPingppPayment = () ->
    if ($ '#checkout_form_payment').is('*')
      $('.pingpp_channel').click ->
        $.ajax
          type: 'patch'
          url: Spree.routes.handle_pingpp
          data: $('#checkout_form_payment').serialize()
          success: (charge)->
            pingppPc.createPayment charge, (result, err) ->
              alert( err )
        false

  Spree.onPingppPayment()
