# Use Case: Place Order

This document provides an outline for all the use cases to place an order.

## Basic Flow for Use Case: Place Order

1. The customer reviews the cart and selects the products they want to purchase.
2. The system displays the products in the cart with their quantities, individual prices (excluding VAT), and the total price.
3. The customer requests to place an order.
4. The system checks if any product is out of stock or if the available quantity is insufficient.
5. The system prompts the customer to provide delivery information, including recipient name, email, phone number, province/city, and delivery address.
6. The customer enters delivery information.
7. The system validates the delivery information.
8. The system calculates and displays the delivery fee.
9. The system checks if the delivery address supports the service and calculates a separate delivery fee for eligible products when rush order delivery is selected.
10. The customer chooses to pay for the order.
11. The system displays and temporarily saves the invoice, which includes:
    - List of products
    - Prices, VAT, and delivery fee
    - Total amount to be paid
12. The customer chooses the payment method.
13. The customer provides all necessary information and places the order.
14. The system connect to VNPay to process the payment
15. The system displays general information of the order and transaction details.
16. The system sends the invoice and payment transaction information to the customer's email.
17. The system records the payment transaction information and the successfully paid order.

## Alternative Flows for Use Case: Place Order

#### 4a. If any product in the cart is out of stock or the available quantity is insufficient:

1. The system displays a message to the customer to adjust the cart.
2. The customer updates the cart and retries placing the order.
3. The flow return to step 4

#### 7a. Invalid Delivery Information: If the delivery information is incomplete or invalid:

1. The system prompts the customer to correct the information.
2. The customer provides the correct information and continues with the order.
3. The flow returns to step 7

#### 9a. The selected products or delivery address do not support rush order delivery:

1. The system informs the customer that rush order delivery is unavailable for some or all products.
2. The customer updates the delivery information or product selection.
3. The system recalculates the delivery fee and updates the invoice.

#### 14a. Payment Failure: If the payment is declined by VNPay:

1. The system displays a message to the customer with the option to retry or update payment details.
2. The customer retries the payment or updates the payment information.
3. The flow return to step 14
