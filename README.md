# orders-microservice

Run:

  orders-microservice/order-srevice$ ruby app/app.rb
  orders-microservice/shipping-service$ ruby app/app.rb
  orders-microservice/shipping-service$ sneakers work OrderWorker --require app/ship_order.rb
  orders-microservice/invoice-service$ sneakers work InvoiceWorker --require app/app.rb

Create order: http://localhost:4567/create
Check orders: http://localhost:4567/list
Check shipments: http://localhost:4568/list
