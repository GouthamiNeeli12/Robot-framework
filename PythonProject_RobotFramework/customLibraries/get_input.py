from robot.api.deco import keyword,library
from robot.libraries.BuiltIn import BuiltIn

@library
class get_input:
    @keyword
    def get_input_from_user(self):
        return input("enter the browser name: ")

