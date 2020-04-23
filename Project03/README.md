# CS 1XA3 Project03 - <MyMacId>

## Usage
    Install conda enivornment with:
        conda create -n yourenvname python=x.x anaconda
    Run locally with:
        python manage.py runserver localhost:8000
    Run on mac1xa3.ca with:
        python manage.py runserver localhost:10092
    Log in with TestUser, password 1234

## Objective 01
    Description:
        - this feature is displayed in signup.djhtml which is rendered by
          signup_view
    Exceptions:
        - Does not work properly for making a new account
        - If the /e/macid/something_post is called without arguments is redirects
          to login.djhtml
