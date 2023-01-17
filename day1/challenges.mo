import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";


actor {
  public func multiple(n:Nat,m:Nat):async Nat{
    // Challenge 1
    return n*m;
  };

  public func volume(n: Nat): async Nat{
    //challenge 2
    return n*n*n;
  };

  public func hours_to_minutes(n: Nat): async Nat{
    //challenge 3
    return n*60;
  };

  var counter = 0;
  public func set_counter(n: Nat): async Bool{
    //challenge 4
    counter := counter + n;
    return true;
  };
  public query func get_counter(): async Nat{
    return counter;
  };

  public func test_divide(m: Nat, n: Nat):async Bool{
    // Challenge 5
    if(m%n==0){
      return true;
    }
    else{
      return false;
    }
  };

 public func is_even(n: Nat):async Bool{
    // Challenge 6
    if(n%2==0){
      return true;
    }
    else{
      return false;
    }
  };
}
