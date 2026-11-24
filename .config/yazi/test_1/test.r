# Test script for syntax highlighting
greet <- function(name) {
    paste0("Hello, ", name, "!")
}

df <- data.frame(x = 1:5, y = c(2, 4, 6, 8, 10))

for (i in 1:5) {
    if (i %% 2 == 0) {
        print(greet("World"))
    }
}
