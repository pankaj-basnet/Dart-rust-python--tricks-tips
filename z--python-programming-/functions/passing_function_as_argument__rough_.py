
def main():

    def widgetBuilder(onDone):
        print("showing password screen...")

        onDone()

    overlayFunc(
        widgetBuilder=widgetBuilder
    )


# # def overlayFunc(onDone):
# def overlayFunc(widgetBuilder):


#     def hideAndonDone(passedValue):
#         print(f'passing value ({passedValue}) to overlayFunc')
    
#     passwordFunc(onDone= hideAndonDone)


# def overlayFunc(widgetBuilder):

#     def  hide():
#         print('hiding password screen')

#     def hideAndonDone(passedValue):
#         hide()
#         print(f'passing value ({passedValue}) to overlayFunc')
    
#     # passwordFunc(onDone= hideAndonDone)

#     # passing hideAndonDone to widgetBuider's onDone parameter
#     passwordFunc(onDone= widgetBuilder(hideAndonDone))


def overlayFunc(widgetBuilder):  # 🌟 Overlay function accepts widgetBuilder.

    def hide():  # 🔒 Function to hide the password screen.
        print('hiding password screen')

    def hideAndonDone(passedValue):  # 🔑 Function that hides the screen and processes the passed value.
        hide()  # Call hide to hide the screen.
        print(f'passing value ({passedValue}) to overlayFunc')  # Pass the value to overlayFunc.

    # Passing hideAndonDone to widgetBuilder's onDone parameter. 🚀
    # passwordFunc(onDone= widgetBuilder(hideAndonDone))  # Calls widgetBuilder and passes hideAndonDone.

    
    widgetBuilder(onDone = passwordFunc(onDone=hideAndonDone))

def passwordFunc(onDone):
    
    onDone('200 ok')


main()


