// Test script for syntax highlighting
package main

import "fmt"

type Animal struct {
    Species string
}

func greet(name string) string {
    return fmt.Sprintf("Hello, %s!", name)
}

func main() {
    nums := []int{1, 2, 3}
    for _, n := range nums {
        if n%2 == 0 {
            fmt.Println(greet("World"), n)
        }
    }
}
