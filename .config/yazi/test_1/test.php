<?php
// Test script for syntax highlighting
function greet($name) {
    return "Hello, " . $name . "!";
}

class Animal {
    public $species;
    public function __construct($species) {
        $this->species = $species;
    }
}

for ($i = 1; $i <= 5; $i++) {
    if ($i % 2 == 0) {
        echo greet("World") . "\n";
    }
}
?>
