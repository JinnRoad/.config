import base64
import sys

try:
    value = int(sys.argv[1])
except IndexError:
    value = 1000
value_bytes = value.to_bytes(6, 'big')
valueb_64 = base64.b64encode(value_bytes, '-_'.encode('ascii')) # Use the URL-safe encoding -_ instead of _/
print(valueb_64.decode('ascii'), end='')
