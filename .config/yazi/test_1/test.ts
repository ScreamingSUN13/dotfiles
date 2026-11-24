// Test script for syntax highlighting
interface Greetable {
    name: string;
}

function greet(entity: Greetable): string {
    return `Hello, ${entity.name}!`;
}

class Animal {
    private species: string;
    constructor(species: string) {
        this.species = species;
    }
}

const nums: number[] = [1, 2, 3];
nums.forEach((n: number) => console.log(n));
