class Testing():
    def __init__(self):
        self.value = 0
    def count(self):
        self.value += 1
    def __str__(self):
        return "{}".format(self.value)

variable = Testing()
print("Hello World {0}".format(variable))

print("Terminating")


