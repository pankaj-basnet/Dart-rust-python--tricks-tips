def main():

    print("------------------------------")

    def widgetBuilder(onDone):  # 🌟 receives onDone callback
        print("showing password screen...")
        onDone()  # 🌟 correctly invoke onDone AFTER widget is shown

    overlayFunc(widgetBuilder=widgetBuilder)

    print("------------------------------")


def overlayFunc(widgetBuilder):  # 🌟 Overlay function accepts widgetBuilder.

    def hide():  # 🔒 hide the password screen
        print("hiding password screen")

    def hideAndonDone(passedValue):  # 🔑 callback that will be given to passwordFunc
        hide()
        print(f"passing value ({passedValue}) to overlayFunc")

    # 🌟 widgetBuilder should be called FIRST, giving it a function
    # 🌟 when widgetBuilder finishes, it should call passwordFunc
    widgetBuilder(
        onDone=lambda: passwordFunc(onDone=hideAndonDone)  # 🌟 correct wiring
    )


def passwordFunc(onDone):
    onDone("200 ok")


main()
