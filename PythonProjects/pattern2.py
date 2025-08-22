def main():
    print_square(4)

def print_square(n):
    for i in range(n):
        for j in range(n):
            print("#",end="")
        print("")

main()