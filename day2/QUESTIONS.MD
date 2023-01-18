# Day 2 🐣
Welcometo day 2 challenge of the Motoko Bootcamp!


# Questions 🙋

1. **Who controls the ledger canister?**
<br>The ledger is controled bt Network Nervous System (NNS).

<br>

2. **What is the subnet of the canister with the id: `mwrha-maaaa-aaaab-qabqq-cai`? How much nodes are running this subnet?**
<br> According to the [IC Network Status Dashboard](https://dashboard.internetcomputer.org/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe), the canister's subnet is identified as `pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe` and it is currently operating with <span style="color: red;">16 nodes</span>.
<br>

3. **I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?**
<br>Using linear interpolation, we can determine that the voting power is multiplied by `1.498` as a result of 4 years of dissolve delay, and by `1.125` as a result of 2 years of locked time. It is also known that 1 ICP is equivalent to 1 power of vote. Therefore, the expected voting power can be calculated to be `10 * 1.498 * 1.125 = 14.23`.

 <br>
 
4. **What is wrong with the following code?**
```motoko
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
}
```
The following code has an error in that the Nat module is not imported. The corrected code should include an import statement for the Nat module.
```motoko
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
};
```
<img src="https://i.ibb.co/yN18Lyb/convert-to-text-candid-UI.png" alt="convert-to-text-candid-UI" border="0">
 <br>
 
5. What is wrong with the following code?
```
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}

```
<br>The array of languages is not properly initialized, it should be done with the `let` keyword and the `var` keyword should be removed from the return type. Additionally, we can use a query function to directly produce the output, eliminating the need for input.<br>
• Actual code:
```Motoko
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor {
  let languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public query func show_languages() : async [Text] {
    return (languages);
  };
 
};
```
<img src="https://i.ibb.co/NNqqmSS/show-language-candid-UI.png" alt="show-language-candid-UI" border="0">
 <br>
 
6. What is wrong with the following code?
<br>
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
 
}
```
The code should include the import of the `Array` library from the base Motoko module and use a `buffer` instead of an array because the append function is no longer supported.
```Motoko
import Array "mo:base/Array"
import Buffer "mo:base/Buffer"

```
<br>


# Coding challenges 🧑‍💻
1. Write a function **average_array** that takes an array of integers and returns the average value of the elements in the array.
```
average_array(array : [Int]) -> async Int. 
```
```Motoko
import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";

actor {
 //challenge 1:
	public func average_array(array: [Int]) : async Int {
		var sum: Int = 0;
		for (n in array.vals()) {
			sum += n;
		};
		return sum / array.size();  
}
```
<br>

2. **Character count**: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
```
count_character(t : Text, c : Char) -> async Nat
```
```Motoko
import Nat "mo:base/Nat";

actor {
//challenge 2:
	public func count_character(t : Text, c : Char) : async Nat {
		var count: Nat = 0;
		for (char in t.chars()) {
			if (char == c) {
				count += 1;
			};
		};
		return count;
	};
}
```
<br>

3. Write a function **factorial** that takes a natural number n and returns the [factorial](https://www.britannica.com/science/factorial) of n.
```
factorial(n : Nat) ->  async Nat
```
```Motoko
import Nat "mo:base/Nat";

actor {
//challenge 3
	public func factorial(n : Nat) : async Nat {
		if (n == 0) {
			return 1;
		} else {
			return n * (await factorial(n - 1));
		};
	};
}
```
<br>

4.  Write a function **number_of_words** that takes a sentence and returns the number of words in the sentence.
```
number_of_words(t : Text) -> async Nat 
```
```Motoko
import Nat "mo:base/Nat";

actor {
// challenge 4:
	public func number_of_words(t : Text) : async Nat {
		var count: Nat = 0;
		if (t.size() > 0) {
			count += 1;
		};
		for (word in t.chars()) {
			if (word == ' ') {
				count += 1;
			};
		};
		return count;
	};
}
```
<br>

5. Write a function **find_duplicates** that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
```
find_duplicates(a : [Nat]) -> async [Nat]
```
```Motoko
import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";

actor {
//challenge 5:
	public func is_on_array(a: [Nat], n: Nat) : async Bool {
		for (num in a.vals()) {
			if (num == n) {
				return true;
			};
		};
		return false;
	};

	public func is_duplicated(a: [Nat], n: Nat) : async Bool {
		var count: Nat = 0;
		for (num in a.vals()) {
			if (num == n) {
				count += 1;
			};
			if (count > 1) {
				return true;
			};
		};
		return count > 1;
	};
	
	public func find_duplicates(a: [Nat]) : async [Nat] {
		var duplicates : [Nat] = [];
		var seen : [Nat] = [];
		for (n in a.vals()) {
			if ((await is_on_array(seen, n)) != false and (await is_duplicated(a, n))) {
				duplicates := Array.append<Nat>(duplicates, [n]);
			};
			seen := Array.append<Nat>(seen, [n]);
		};
		return duplicates;
	};
}
```
<br>

6. Write a function **convert_to_binary** that takes a natural number n and returns a string representing the binary representation of n.
```
convert_to_binary(n : Nat) -> async Text
```
```Motoko
import Nat "mo:base/Nat";

actor {
//Challenge 6:
	public func convert_to_binary(n : Nat) : async Text {
		if (n == 0) {
			return "0";
		} else {
			return (await convert_to_binary(n / 2)) # Nat.toText(n % 2);
		};
	};
}
```

