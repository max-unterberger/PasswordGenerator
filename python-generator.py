#!/usr/bin/env python3
import secrets
import string

def generate_password(length: int = 20) -> str:
    """
    Password Generator Script
    Generates a 20-character password composed of random upper/lower-case letters, digits, and symbols (!, #, $)
    :3
    """
    alphabet = string.ascii_letters + string.digits + "!#$"
    # secrets.choice is cryptographically secure and runs in O(1) per pick
    return ''.join(secrets.choice(alphabet) for _ in range(length))

if __name__ == "__main__":
    print()
    print(generate_password())

