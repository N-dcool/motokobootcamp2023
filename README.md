# motokobootcamp2023 
<table>
  <tr>
  <td ><a href="https://forum.dfinity.org/t/motoko-bootcamp-2023-getting-started-on-the-internet-computer/16846"><img src="https://pbs.twimg.com/media/FmHudZ9WAAYFpUa?format=jpg&name=large" width="300px" height="500px" alt="Myself"/><br /><sub><b>Motoko Bootcamp 2023</b></sub></a><br /></td>
  <td ><a href="https://github.com/Nareshchoudhary02"><img src="https://i.ibb.co/nR1k4dZ/Myself-with-indian-flag.jpg" width="200px" alt="Myself"/><br /><sub><b>Naresh Choudhary</b></sub></a><br /></td>
  </tr>
</table>

<br>Motoko Bootcamp Challenges Repo

# Day 1 🥚
Welcome to very 1st day into the **Motoko Bootcamp 2023**.

# <a id="questions"> 🙋 Questions </a>
1. How much is the current memory capacity of a canister? <br>
<b>Ans:</b>
```
The stable memory of a canister is 8 GB (used to be 4 GB). The Wasm heap is still limited to 4 GB.
```
2. What is the issue with the following code sample?<br>
<b>Ans:</b>
```
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```
```
The error in the code you provided is that the variable "counter" is being treated as a "let" and cannot be reassigned a new value.
In the increment_counter function, you are trying to re-assign the value of "counter" using the ":=" operator this is not possible declare var counter instead of let counter.

Also it seems like you are trying to use async keyword for synchronous function. It should be removed for this function.

```
<h4>Corrected code:</h4>
<img src="https://i.ibb.co/ZGGFrjz/Screenshot-2023-01-17-at-9-58-31-PM.png" alt="Screenshot-2023-01-17-at-9-58-31-PM" border="0">

3. What is the issue with the following code sample?
```
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
```
<b>ANS: </b>
<h4>Error:</h4>
```
type error [M0050], literal of type
  Nat
does not have expected type
  Text
  ```
<h4>Correct Code: </h4>  

<img src="https://i.ibb.co/g4kVBPf/Screenshot-2023-01-17-at-10-02-17-PM.png" alt="Screenshot-2023-01-17-at-10-02-17-PM" border="0">

<h4>OUTPUT:</h4>
<img src="https://i.ibb.co/mNxDz9h/Screenshot-2023-01-17-at-10-01-55-PM.png" alt="Screenshot-2023-01-17-at-10-01-55-PM" border="0">

4.  False or True: we can remove the keyword **async** for return argument of a query function since queries are faster to answer.
 False.


# <a id="coding-challenges"> 🥊 Coding challenges </a>
1. Write a function **multiply** that takes two natural numbers and returns the product. 
```
multiply(n : Nat, m : Nat) -> async Nat
```
<h3>Code:<h3>
<img src="https://i.ibb.co/fCX3TVG/multiple-code.png" alt="multiple-code" border="0">
  
<h3>Candid UI</h3>
<img src="https://i.ibb.co/gynKFKH/Multiple-Candid-UI.png" alt="Multiple-Candid-UI" border="0">
  
  
2. Write a function **volume** that takes a natural number n and returns the volumte of a cube with side length n.
```
volume(n : Nat) -> async Nat
```
<h3>Code:<h3>
<img src="https://i.ibb.co/6Y8kkR4/volume-code.png" alt="volume-code" border="0">
  
<h3>Candid UI</h3>
<img src="https://i.ibb.co/j3r0hqJ/volume-candid-UI.png" alt="volume-candid-UI" border="0">
  
3. Write a function **hours_to_minutes** that takes a number of hours n and returns the number of minutes.
```
hours_to_minutes(n : Nat) -> async Nat
```
<h3>Code:<h3>
<img src="https://i.ibb.co/KbVzn6y/hours-to-minutes-code.png" alt="hours-to-minutes-code" border="0">
  
<h3>Candid UI</h3>
<img src="https://i.ibb.co/Z1j24md/hours-to-minutes-candid-UI.png" alt="hours-to-minutes-candid-UI" border="0">
4. Write two functions **set_counter** & **get_counter** .

- set_counter sets the value of counter to n.
- get_counter returns the current value of counter.
```
set_counter(n : Nat) -> async ()
get_counter() -> async Nat
```
<h3>Code:<h3>
<img src="https://i.ibb.co/wWwbY5N/get-set-code.png" alt="get-set-code" border="0">
  
<h3>Candid UI</h3>
<img src="https://i.ibb.co/cx2dPDb/get-set-candid-UI.png" alt="get-set-candid-UI" border="0">
  
5. Write a function **test_divide** that takes two natural numbers n and m and returns a boolean indicating if n divides m.
```
test_divide(n: Nat, m : Nat) -> async Bool
```
<h3>Code:<h3>
<img src="https://i.ibb.co/3FpMsX1/test-divide-code.png" alt="test-divide-code" border="0">
<h3>Candid UI</h3>
<img src="https://i.ibb.co/R6frQFg/test-divide-candid-UI.png" alt="test-divide-candid-UI" border="0">
  
6. Write a function **is_even** that takes a natural number n and returns a boolean indicating if n is even.
```
is_even(n : Nat) -> async Bool 
```
<h3>Code:<h3>
<img src="https://i.ibb.co/QC8Y5Z5/is-even-code.png" alt="is-even-code" border="0">
<h3>Candid UI</h3>
<img src="https://i.ibb.co/TbpcXd6/is-even-candid-UI.png" alt="is-even-candid-UI" border="0">


