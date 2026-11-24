// Test script for syntax highlighting
const greet = (name) => `Hello, ${name}!`;

class Animal {
    constructor(species) {
        this.species = species;
    }
}

for (let i = 0; i < 5; i++) {
    if (i % 2 === 0) {
        console.log(greet("World"), i);
    }
}
