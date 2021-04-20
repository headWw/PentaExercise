API for managing groceries lists
Requirements:
    - a user can be created at an endpoint (up to dev what endpoint)
        * the user will have the following fields (mandatory, can include others optionally):
            # name
            # email
    - a user can log in through the API and receive his data (again dev will choose method of logging and session persistence)
    - once logged in a user can:
        * get a list of his previous groceries
        * add items to his most recent grocery list
        * mark items as being bought on his most recent grocery list
        * view a specific past grocery list (or a subset ex: between 2 dates)
    - grocery lists can have one or more items (not 0)
    - items must have a readable name (no special characters) and a valid positive numerical quantity
ETA: 3h 30m - 4h 
