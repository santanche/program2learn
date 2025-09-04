# Flexible Number Generator
*by Claude.ai*

## Java
~~~java
public class NumberGenerator {
    private int current = 0;
    
    public int first() {
        this.current = 1;
        return this.current;
    }
    
    public int next() {
        this.current += 1;
        return this.current;
    }
    
    public int getCurrent() {
        return this.current;
    }
    
    public static void main(String[] args) {
        NumberGenerator gen = new NumberGenerator();
        
        // Type checking at compile time
        int firstNum = gen.first();     // Must be int
        int secondNum = gen.next();     // Must be int
        
        System.out.println("First: " + firstNum);
        System.out.println("Second: " + secondNum);
        
        // This would cause a compile-time error:
        // String invalidAssignment = gen.next(); // Cannot convert int to String
        
        // If we want to change behavior, we need method overloading or generics
        // Example with method overloading:
        NumberGeneratorFlexible flexGen = new NumberGeneratorFlexible();
        int intResult = flexGen.next();
        String stringResult = flexGen.nextAsString();
    }
}

// Example showing Java's approach to handling different return types
class NumberGeneratorFlexible {
    private int current = 0;
    
    public int next() {
        this.current += 1;
        return this.current;
    }
    
    public String nextAsString() {
        this.current += 1;
        return "Number: " + this.current;
    }
    
    // Or using generics for more flexibility
    public <T> T nextAs(Class<T> type) {
        this.current += 1;
        if (type == Integer.class) {
            return type.cast(this.current);
        } else if (type == String.class) {
            return type.cast("Number: " + this.current);
        }
        throw new IllegalArgumentException("Unsupported type");
    }
}
~~~

## Python
~~~python
class NumberGenerator:
    def __init__(self):
        self.current = 0
    
    def first(self):
        self.current = 1
        return self.current
    
    def next(self):
        self.current += 1
        return self.current

# Basic usage - same as Java conceptually
gen = NumberGenerator()
first_num = gen.first()     # No type declaration needed
second_num = gen.next()     # Python infers types at runtime

print(f"First: {first_num}")
print(f"Second: {second_num}")

# Python's dynamic typing allows runtime flexibility
class FlexibleNumberGenerator:
    def __init__(self):
        self.current = 0
        self.return_type = int  # Can be changed at runtime!
    
    def first(self):
        self.current = 1
        return self._convert_return(self.current)
    
    def next(self):
        self.current += 1
        return self._convert_return(self.current)
    
    def _convert_return(self, value):
        if self.return_type == int:
            return value
        elif self.return_type == str:
            return f"Number: {value}"
        elif self.return_type == float:
            return float(value)
        elif callable(self.return_type):  # Custom function
            return self.return_type(value)
        return value
    
    def set_return_type(self, new_type):
        """Change return type at runtime - impossible in Java!"""
        self.return_type = new_type

# Demonstrate dynamic typing flexibility
flex_gen = FlexibleNumberGenerator()

# Returns integers
print("Integer mode:")
print(flex_gen.next())  # 1
print(flex_gen.next())  # 2

# Switch to string mode at runtime
flex_gen.set_return_type(str)
print("\nString mode:")
print(flex_gen.next())  # "Number: 3"
print(flex_gen.next())  # "Number: 4"

# Switch to float mode
flex_gen.set_return_type(float)
print("\nFloat mode:")
print(flex_gen.next())  # 5.0

# Use custom function
flex_gen.set_return_type(lambda x: x ** 2)
print("\nSquared mode:")
print(flex_gen.next())  # 36 (6 squared)

# Variables can change types freely
result = flex_gen.next()  # Could be int, str, float, etc.
print(f"Result type: {type(result)}, value: {result}")

# This variable can hold different types throughout execution
flexible_var = 42        # int
flexible_var = "hello"   # str
flexible_var = [1, 2, 3] # list
flexible_var = flex_gen  # object
print(f"Final type: {type(flexible_var)}")

# Demonstrate duck typing
class DuckNumberGenerator:
    def __init__(self):
        self.current = 0
    
    def next(self):
        self.current += 1
        return self.current

def use_generator(generator):
    """This function works with any object that has a 'next' method"""
    return generator.next()

# Both work with the same function - no explicit interface needed
regular_gen = NumberGenerator()
duck_gen = DuckNumberGenerator()

print(f"\nDuck typing demo:")
print(f"Regular: {use_generator(regular_gen)}")
print(f"Duck: {use_generator(duck_gen)}")

# Strong typing aspect - Python still prevents nonsensical operations
try:
    result = "5" + 3  # This will raise TypeError
except TypeError as e:
    print(f"\nStrong typing in action: {e}")
    print("Must convert explicitly: '5' + str(3) =", "5" + str(3))
~~~