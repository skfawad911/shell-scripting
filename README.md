# Shell Scripting

# **Introduction to Shell Scripting**

*Overview:*

Shell scripting is a powerful tool that allows you to automate tasks and execute commands in a sequence. It is a series of commands written in a plain text file that can be executed by the shell. The shell is a command-line interpreter that acts as an interface between the user and the operating system.

*Importance:*

- **Automation:** Shell scripts automate repetitive tasks, saving time and reducing the chance of human error.
- **System Administration:** Essential for managing and configuring systems efficiently.
- **Customization:** Users can create custom scripts to tailor their computing environment.

*Shells:*

- **bash (Bourne Again SHell):** Widely used default shell on Linux systems.
- **sh (Bourne Shell):** The original Unix shell, simpler than bash.
- **zsh, ksh, etc.:** Other shells with additional features and improvements.

*Role of Shells:*

- **Parsing and Executing Commands:** The shell interprets commands and executes them.
- **Script Execution:** Shells execute scripts by interpreting the commands sequentially.

# **Setting Up Your Environment**

*Text Editors:*

- **nano:** Simple and beginner-friendly text editor.
- **vim (Vi Improved):** Powerful, but has a steeper learning curve.
- **VSCode:** A modern and feature-rich code editor with excellent shell scripting support.

*Setting Execution Permissions:*

- Use the **`chmod`** command to set execute permissions.
    
    ```bash
    chmod +x script.sh
    ```
    
- Without execution permissions, a script cannot be run.

*Recommendations:*

- Choose a text editor that suits your preferences and needs.
- Make scripts executable only by the necessary users for security.

# **Basic Script Structure**

*Shebang (#!/bin/bash):*

- Placed at the beginning of the script to indicate the shell to be used.
- For bash scripts, it is **`#!/bin/bash`**.
- Allows the script to be executed directly without explicitly invoking the shell.

*Hello World Script:*

```bash

#!/bin/bash
# This is a simple script that prints "Hello, World!" to the console.
echo "Hello, World!"

echo "Welcome to my first bash script"
```

- Comments (lines starting with **`#`**) improve script readability but are not executed.
- **`echo`** is used to print text to the console.

*Execution:*

- Save the script with a **`.sh`** extension (e.g., **`hello_world.sh`**).
- Make it executable: **`chmod +x hello_world.sh`**.
- Run the script: **`./hello_world.sh`**.

*Purpose:*

- Introduces script structure and syntax.
- Demonstrates the execution of a basic script.

# **Variables and Data Types**

## *Variables:*

- **Declaration:** Variables are declared by assigning a value to them. No explicit data type declaration is required.
    
    ```bash
    my_var="Hello"
    ```
    
- **Naming Convention:** Variable names can consist of letters, numbers, and underscores but must start with a letter.
- **Accessing Variables:** To access the value stored in a variable, prefix its name with a dollar sign (**`$`**).
    
    
    ```bash
    echo $my_var
    ```
    

## *Data Types:*

- **Strings:** Sequences of characters enclosed in single or double quotes.
    
    ```bash
    my_string="I am a string"
    ```
    
- **Numbers:** Shell scripting supports arithmetic operations on integers.
    
    ```bash
    num1=10
    num2=5
    ```
    
- **Type Coercion:** Shell scripting does not have explicit data types. Variables are treated as strings unless specified otherwise.

## *Using Variables:*

- **Concatenation:** Use variables within strings by enclosing them in double quotes.
    
    ```bash
    
    greeting="Hello"
    echo "$greeting, $USER!"
    
    ```
    
- **Arithmetic Operations:** Perform arithmetic using **`$((...))`** syntax.
    
    ```bash
    
    result=$((num1 + num2))
    echo "Result: $result"
    
    ```
    

*Best Practices:*

- **Descriptive Names:** Choose meaningful variable names for better code readability.
- **Consistency:** Follow a consistent naming convention throughout your scripts.
- **Scoping:** Be mindful of variable scope to avoid unintended behavior.

*Purpose:*

- Introduces the concept of variables and their usage.
- Explains different data types available in shell scripting.
- Demonstrates basic operations with variables and data types.

# **Input and Output**

*Reading Input from Users:*

- **`read` Command:** Allows the script to read input from the user.
    
    ```bash
    echo "Enter your name:"
    read name
    echo "Hello, $name!"
    
    ```
    
- **Prompting:** Provide a prompt message to guide the user.
    
    ```bash
    read -p "Enter your age: " age
    
    ```
    
- **Reading into Multiple Variables:**
    
    ```bash
    read -p "Enter your first name and last name: " first_name last_name
    
    ```
    

*Displaying Output using **`echo`**:*

- **Simple Output:**
    
    ```bash
    echo "Hello, World!"
    
    ```
    
- **Variable Substitution:**
    
    ```bash
    greeting="Welcome"
    echo "$greeting, $USER!"
    
    ```
    
- **Escape Characters:**
    
    ```bash
    echo "This is a new line.\nThis is another line."
    
    ```
    

*Formatted Output:*

- **Colorizing Output:**
    
    ```bash
    echo -e "\e[1;31mError:\e[0m File not found."
    
    ```
    
- **Formatting Output:**
    
    Formatting output is essential for improving the readability and presentation of information displayed to users. While the `echo` command is useful for simple output, `printf` provides more control over formatting. Let's delve deeper into formatting outputs using `printf`:
    

**1. Format Specifiers:**

- Format specifiers define the layout and type of data to be printed. They start with `%` followed by a character denoting the data type.
- Common format specifiers include:
    - `%s` for strings
    - `%d` for integers
    - `%f` for floating-point numbers
    - `%c` for characters
    - `%x`, `%X` for hexadecimal numbers
    - `%b` for printing backslash escapes

**2. Width and Precision:**

- You can specify the width and precision of output fields.
    - `%-10s`: Left-justified string with a width of 10 characters.
    - `%10s`: Right-justified string with a width of 10 characters.
    - `%.2f`: Floating-point number with two decimal places.

**3. Justification:**

- Use the `“-”`flag to left-align text and positive numbers.
- Omitting the `“-”` flag will right-align text and positive numbers by default.

**4. Escape Sequences:**

- You can include special escape sequences to control text formatting, such as newline `\\n`, tab `\\t`, and backspace `\\b`.

**5. Colorizing Output:**

- In Bash, you can use ANSI escape codes to apply colors to text.
    - `\\e[1;31m`: Start of red text.
    - `\\e[0m`: Reset text color to default.

**6. Examples:**

- Formatting a string and an integer:
    
    ```bash
    printf "Name: %-10s \\t Age: %d\\n" "$name" "$age"
    
    ```
    
- Formatting floating-point numbers with precision:
    
    ```bash
    printf "Average: %.2f\\n" "$average"
    
    ```
    
- Colorizing error messages:
    
    ```bash
    printf "\\e[1;31mError:\\e[0m File not found.\\n"
    
    ```
    

**7. Usage Caution:**

- Be mindful of the data type and corresponding format specifier to avoid unintended behavior.
- Ensure proper alignment and readability, especially when displaying tabular data.

By mastering formatting techniques, you can enhance the clarity and visual appeal of your script's output, making it easier for users to interpret and understand the information presented.

```bash
printf "Name: %-10s \t Age: %d\n" "$name" "$age"

```

*Purpose:*

- Teaches how to interact with users by reading input.
- Demonstrates various ways to display output using **`echo`**.
- Explains formatting options for enhancing output readability.

# Arguments

*Overview:*
In shell scripting, arguments are values provided to a script when it is executed. These values are passed to the script as positional parameters and can be accessed within the script to customize its behavior.

*Positional Parameters:*

- **$0:** Represents the name of the script itself.
- **$1, $2, ...:** Represent the first, second, and subsequent arguments passed to the script.
- **$#:** Indicates the total number of arguments passed.

*Accessing Arguments:*

- Use the positional parameters directly to access the arguments.
    
    ```bash
    echo "Script name: $0"
    echo "First argument: $1"
    echo "Second argument: $2"
    
    ```
    

*Example Usage:*

- Running a script with arguments:
    
    ```bash
    ./script.sh arg1 arg2
    
    ```
    
- Inside the script, accessing the arguments:
    
    ```bash
    #!/bin/bash
    echo "Script name: $0"
    echo "First argument: $1"
    echo "Second argument: $2"
    
    ```
    

*Special Parameters:*

- **$@:** Represents all the arguments passed to the script as a single string.
- **$?:** Indicates the exit status of the last command executed.

*Purpose:*

- Demonstrates how to pass arguments to a shell script.
- Illustrates accessing and using arguments within a script.
- Introduces special parameters for handling arguments effectively.

# **Conditional Statements**

*Overview:*
Conditional statements in shell scripting allow you to make decisions based on certain conditions. They enable your script to execute different code paths depending on whether conditions are true or false.

*If Statements:*

- **Syntax:**
    
    ```bash
    if [ condition ]; then
        # code to execute if condition is true
    fi
    
    ```
    
- **Example:**
    
    ```bash
    if [ "$num" -gt 10 ]; then
        echo "Number is greater than 10"
    fi
    
    ```
    

*Comparison Operators:*

- **Numeric Comparisons:**
    - `eq`: Equal to
    - `ne`: Not equal to
    - `gt`: Greater than
    - `lt`: Less than
    - `ge`: Greater than or equal to
    - `le`: Less than or equal to
- **String Comparisons:**
    - `=`: Equal to
    - `!=`: Not equal to
    - `z`: String is empty
    - `n`: String is not empty

*Logical Operators:*

- **AND (`&&`):** Executes the next command if the previous command succeeds.
- **OR (`||`):** Executes the next command if the previous command fails.

*If-Else Statements:*

- **Syntax:**
    
    ```bash
    if [ condition ]; then
        # code to execute if condition is true
    else
        # code to execute if condition is false
    fi
    
    ```
    
- **Example:**
    
    ```bash
    if [ "$num" -gt 10 ]; then
        echo "Number is greater than 10"
    else
        echo "Number is not greater than 10"
    fi
    
    ```
    

***If-Elif Statements:***

- If-Elif statements are used when there are multiple conditions to be checked, and only one block of code needs to be executed based on the first condition that evaluates to true.
- Syntax:
    
    ```bash
    
    if [ condition1 ]; then
        # code to execute if condition1 is true
    elif [ condition2 ]; then
        # code to execute if condition2 is true
    elif [ condition3 ]; then
        # code to execute if condition3 is true
    else
        # code to execute if none of the conditions are true
    fi
    
    ```
    
- Example:
    
    ```bash
    
    if [ "$num" -eq 0 ]; then
        echo "Number is zero"
    elif [ "$num" -gt 0 ]; then
        echo "Number is positive"
    else
        echo "Number is negative"
    fi
    
    ```
    

*Nested If Statements:*

- You can nest if statements inside each other to create more complex conditional logic.
- Allows you to have if statements inside other if or else blocks.
- Example:
    
    ```bash
    
    if [ "$num" -gt 0 ]; then
        if [ "$num" -lt 10 ]; then
            echo "Number is between 0 and 10"
        fi
    fi
    
    ```
    

*Case Statements:*

- Useful for testing multiple conditions within a single statement.
- Provides a cleaner alternative to nested if-else statements when testing multiple conditions.
- Syntax:
    
    ```bash
    
    case "$variable" in
        pattern1)
            # code to execute if variable matches pattern1
            ;;
        pattern2)
            # code to execute if variable matches pattern2
            ;;
        *)
            # default code to execute if no pattern matches
            ;;
    esac
    
    ```
    

*Purpose:*

- Introduces the concept of conditional statements and their syntax in shell scripting.
- Explains how to use comparison and logical operators for condition evaluation.
- Demonstrates the execution flow based on different conditions using if and if-else statements.

# Loops

*Overview:*

Loops in shell scripting allow you to execute a block of code repeatedly based on certain conditions. They are essential for automating repetitive tasks and processing data iteratively.

## 1. For Loops

- **Syntax:**
    
    ```bash
    for variable in [list]; do
        # code to execute
    done
    
    ```
    
- **Example:**
    
    ```bash
    for i in {1..5}; do
        echo "Iteration $i"
    done
    
    ```
    
- **Explanation:** The loop iterates over each item in the list (in this case, numbers from 1 to 5) and executes the code block for each iteration.
- Example 2 :-

```json
#!/bin/bash
<< comment
#for loops for creating directories

for (( i=1 ; i<=5 ; i++ ));
do
mkdir "Day$i"
done

echo "Created 5 directories....."

comment

for (( i=1;i<=5;i++));
do
rmdir "Day$i"
done
```

## **2. While Loops:**

- **Syntax:**
    
    ```bash
    
    while [ condition ]; do
        # code to execute
    done
    
    ```
    
- **Example:**
    
    ```bash
    
    count=0
    while [ $count -lt 5 ]; do
        echo "Count: $count"
        ((count++))
    done
    
    ```
    
- **Explanation:** The loop continues executing the code block as long as the condition (**`$count`** less than 5) remains true. The count is incremented in each iteration.

## **3. Until Loops:**

- **Syntax:**
    
    ```bash
    
    until [ condition ]; do
        # code to execute
    done
    
    ```
    
- **Example:**
    
    ```bash
    
    num=10
    until [ $num -eq 0 ]; do
        echo "$num"
        ((num--))
    done
    
    ```
    
- **Explanation:** The loop continues executing the code block until the condition (**`$num`** equal to 0) becomes true. The value of **`$num`** is decremented in each iteration.

---

# **Functions**

*Overview:*
Functions in shell scripting allow you to encapsulate a sequence of commands into a reusable block of code. They provide modularity, improve code readability, and facilitate code maintenance by breaking down complex tasks into smaller, manageable units.

**1. Defining Functions:**

- Syntax:
    
    ```bash
    function_name() {
        # commands
    }
    
    ```
    
- Example:
    
    ```bash
    print_message() {
        echo "Hello, World!"
    }
    
    ```
    

**2. Calling Functions:**

- To call a function, simply use its name followed by parentheses.
    
    ```bash
    function_name
    
    ```
    
- Example:
    
    ```bash
    print_message
    
    ```
    

**3. Passing Arguments to Functions:**

- You can pass arguments to functions similar to how you pass arguments to scripts.
- Arguments are accessed within the function using positional parameters (**`$1`**, **`$2`**, etc.).
- Example:
    
    ```bash
    greet() {
        echo "Hello, $1!"
    }
    
    greet "Alice"
    
    ```
    

**4. Returning Values from Functions:**

- Shell functions can return values using the **`return`** statement.
- The return value is captured using **`$?`** after calling the function.
- Example:
    
    ```bash
    get_sum() {
        local sum=$(( $1 + $2 ))
        return $sum
    }
    
    get_sum 5 3
    result=$?
    echo "Sum: $result"
    
    ```
    

**5. Local Variables:**

- Variables declared within a function are local by default and are not accessible outside the function.
- Use the **`local`** keyword to declare local variables explicitly.
- Example:
    
    ```bash
    calculate_average() {
        local total=$1
        local count=$2
        local average=$(( total / count ))
        echo "Average: $average"
    }
    
    ```
    

**6. Recursive Functions:**

- Shell functions can be recursive, allowing a function to call itself.
- Example:
    
    ```bash
    factorial() {
        local n=$1
        if [ $n -eq 0 ]; then
            echo 1
        else
            echo $(( n * $(factorial $(( n - 1 ))) ))
        fi
    }
    
    ```
    

**7. Purpose:**

- Introduces the concept of functions and their usage in shell scripting.
- Demonstrates how to define, call, and pass arguments to functions.
- Explains the importance of local variables and returning values from functions.
- Provides examples of common use cases, such as recursive functions and functions for performing specific tasks.
