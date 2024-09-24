# Use Case outline

This document provides an outline for all the use cases to place an order.

## Use Case: Place Order

### Basic Flow for Use Case: Place Order

1. Customer reviews their cart and selects desired products.
2. Customer initiates the order placement.
3. System checks product availability (check inventory)
4. Customer provides delivery details (name, email, phone, province/city, and address)
5. System calculates and displays shipping costs based on location and product weight. (invoke **Place Rush Order** Use Case)
6. System invokes the **Pay Order** use case.
7. System records transaction details and confirms successful payment.

### Alternative Flows for Use Case: Place Order

#### 3a. Insufficient stock for one or more items.

1. System displays a stock shortage notification, indicating available quantities for affected items.
2. Customer modifies their cart.
3. Customer reinitiates the order placement.
4. Returns to Step 3 of the Basic flow.

#### 4a. Customer submits invalid or incomplete delivery information.

1. System shows an error message highlighting missing or incorrect fields.
2. Customer revises delivery information.
3. Returns to Step 4 of the Basic flow.

#### 4b. The customer chooses rush order delivery option.

1. System calls the use case **Place Rush Order**.
2. Returns to Step 5 of the Basic Flow.

## Use Case: Pay Order

### Basic Flow for Use Case: Pay Order

1. System displays and temporarily stores the invoice, including:
   - Product list
   - Prices, VAT, and shipping fee
   - Total payable amount
2. Customer selects credit card payment.
3. System connects to VNPay for credit card processing.
4. The customer provides all the necessary information and steps as requested by VNPay
5. VNPay validates the payment information and processes the transaction.
6. System receives the transaction confirmation from VNPay.
7. Upon successful payment, system shows order details (e.g., customer info, shipping address, transaction ID).
8. System emails invoice and payment confirmation.

### Alternative Flows for Use Case: Pay Order

#### 5a. VNPay payment fails.

1. System displays an error message, prompting customer to retry or update payment details.
2. Customer retries payment or updates information.
3. Return to Step 5 of the Basic Flow

## Use Case: Place Rush Order

### Basic Flow for Use Case: Place Rush Order

1. System verifies if delivery address and products are eligible for expedited shipping.
2. System requests additional expedited shipping information from customer.
3. **Place Order** use case continues.

### Alternative Flows for Use Case: Place Rush Order

#### 1a. Selected products or delivery address ineligible for expedited shipping.

1. System informs customer that expedited shipping is unavailable for some or all items.
2. Customer revises delivery information or product selection.
3. Return to Step 1 of the Basic Flow.
