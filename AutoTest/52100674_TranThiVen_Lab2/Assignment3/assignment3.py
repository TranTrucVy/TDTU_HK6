import math

def solve_equationroots(a, b, c):
    # Convert coefficients to numeric values if they are strings
    a = float(a)
    b = float(b)
    c = float(c)
    
    delta = b**2 - 4*a*c
    if delta < 0:
        return "No real roots"
    elif delta == 0:
        x = -b / (2*a)
        return x
    else:
        x1 = (-b + math.sqrt(delta)) / (2*a)
        x2 = (-b - math.sqrt(delta)) / (2*a)
        return x1, x2
