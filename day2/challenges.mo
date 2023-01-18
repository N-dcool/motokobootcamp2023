import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";

actor {
	//Challenge 1
	public func average_array(array: [Int]) : async Int {
		var sum: Int = 0;
		for (n in array.vals()) {
			sum += n;
		};
		return sum / array.size();
	};

	///Challenge 2
	public func count_character(t : Text, c : Char) : async Nat {
		var count: Nat = 0;
		for (char in t.chars()) {
			if (char == c) {
				count += 1;
			};
		};
		return count;
	};

	//Challenge 3
	func factorial(n : Nat) : async Nat {
		if (n == 0) {
			return 1;
		} else {
			return n * (await factorial(n - 1));
		};
	};

	//Challenge 4
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

	//Challenge 5
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

	//Challenge 6
	public func convert_to_binary(n : Nat) : async Text {
		if (n == 0) {
			return "0";
		} else {
			return (await convert_to_binary(n / 2)) # Nat.toText(n % 2);
		};
	};
}


