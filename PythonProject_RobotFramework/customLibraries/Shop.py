import time

from robot.api.deco import keyword, library
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop():
    def __init__(self):
        #To use selenium Library functionalities in the python file we need to import it and use it in the methods along with robot keywords
        self.selLib=BuiltIn().get_library_instance('SeleniumLibrary')


    @keyword
    def hello_world(self):
        print("Hello world")

    @keyword
    def add_item_to_cart_and_checkout(self,product_list):
        #below method is equal to keyword Get Webelements and it accepts the locator
        productTitle=self.selLib.get_webelements("xpath://div[@class='card-body']/h4")
        for product in productTitle:
            text=product.text
            if product.text in product_list:
                button=self.selLib.get_webelement("xpath://div[@class='card-body']/h4[normalize-space()='"+text+"']/parent::div/parent::div/div/button")
                self.selLib.click_element(button)




