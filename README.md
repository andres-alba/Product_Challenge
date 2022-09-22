# Alcumus Flutter Live coding exercise

### This exercise will cover you ability to:
- Create/Update Widgets
- Problem solving
- Write Unit Tests
- Peer Program

## Steps
    1. Update the Product.dart getStockName method to return “Limited stock” when stock count is 50 or less otherwise, return stock as a string.
    2. Update the ProductController.dart retrieveAllProducts method to consume data from the following endpoint https://dummyjson.com/products. This method currently have a few minor bugs.
    3. Render the collection of products in a scrollable widget utilizing only the following fields: title, description, stock, images(only one image)
    4. Ensure the failing tests passes

## Extra points:

    1. Optimize the rendering of the product list
    2. Fix Memory Leak in the ProductScreen widget
    3. Add a new field “category” to the Product domain
    4. Add a row of buttons to filter the products by category
    5. Add unit tests to cover the method or function added to filter by category
    6. Prettify the UI
