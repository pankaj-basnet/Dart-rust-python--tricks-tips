def format_measurement(value: float, unit: str) -> str :
    return f'{value} {unit}'

print("---- string_concatenation -----")
print(format_measurement(120, "mmHg"))

# OUTPUT:
# ---- string_concatenation -----
# 120 mmHg


