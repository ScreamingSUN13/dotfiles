"""Module docstring: sample file to test syntax highlighting."""

import os
import sys
from dataclasses import dataclass
from typing import Optional, List, Dict

CONSTANT_VALUE = 42
PI = 3.14159
GREETING = "Hello, world!"
MULTILINE = """
This is a multiline string.
It should highlight differently.
"""


class Animal:
    """Base class for animals."""

    species_count: int = 0

    def __init__(self, name: str, legs: int = 4) -> None:
        self.name = name
        self.legs = legs
        Animal.species_count += 1

    def speak(self) -> str:
        raise NotImplementedError

    def __repr__(self) -> str:
        return f"<Animal name={self.name!r} legs={self.legs}>"


class Dog(Animal):
    def speak(self) -> str:
        return f"{self.name} says Woof!"


@dataclass
class Point:
    x: float
    y: float

    def distance_to(self, other: "Point") -> float:
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** 0.5


def fibonacci(n: int) -> List[int]:
    """Return the first n Fibonacci numbers."""
    sequence: List[int] = []
    a, b = 0, 1
    for _ in range(n):
        sequence.append(a)
        a, b = b, a + b
    return sequence


def process_data(items: Optional[Dict[str, int]] = None) -> None:
    if items is None:
        items = {}
    for key, value in items.items():
        if value % 2 == 0:
            print(f"{key}: {value} is even")
        elif value < 0:
            print(f"{key}: {value} is negative")
        else:
            print(f"{key}: {value} is odd")

    try:
        risky = 10 / len(items)
    except ZeroDivisionError as e:
        print(f"Caught an error: {e}")
    finally:
        print("Done processing.")


async def fetch_something(url: str) -> bool:
    # Pretend async call
    return url.startswith("https")


def main() -> None:
    dog = Dog("Rex")
    print(dog.speak())
    print(repr(dog))

    p1, p2 = Point(0, 0), Point(3, 4)
    print(f"Distance: {p1.distance_to(p2)}")

    print(fibonacci(10))
    process_data({"a": 1, "b": 2, "c": -3})

    numbers = [x * x for x in range(10) if x % 2 == 0]
    lookup = {k: v for k, v in enumerate(numbers)}
    print(numbers, lookup)

    lambda_test = lambda x: x ** 2  # noqa: E731
    print(lambda_test(5))

    print(CONSTANT_VALUE, PI, GREETING, sep=" | ")
    print(os.name, sys.platform)


if __name__ == "__main__":
    main()
