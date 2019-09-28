(** This syntax library provides three different types of operators: binding
    operators, infix operators, and prefix operators. *)

(** {1:bindings Binding Operators}

    A couple of general rules to read those.

    1. The first character notes the kind of binding that it is:

    - The character [>] evokes a monadic binding (read [>>=])
    - The character [|] evokes a monadic mapping (read [>|=])

    2. The rest of the characters note the types used in the binding. *)

(** {2:bindopt Options}

    The character that represents option types is [?]. *)

val ( let|? ) : 'a option -> ('a -> 'b) -> 'b option
(** [let|? x = y in f x] is [Some (f a)] if [y = Some a], and [None]
    otherwise.

    I use it to get a value that might not exist, and do something with it
    only if it exists.

    Example:

    {[
      let|? x = get_int_option () in
      x + 2
    ]}*)

val ( let>? ) : 'a option -> ('a -> 'b option) -> 'b option
(** [let>? x = y in f x] is [f a] if [y = Some a], and [None] otherwise.

    I use it to get a value that might not exist, and do something with it
    that is only defined in some cases, only if it exists.

    For example:

    {[
      let x = 2 in
      let>? y = get_int_option () in
      if y = 0 then None else Some (x/y)
    ]} *)

val ( and*? ) : 'a option -> 'b option -> ('a * 'b) option

(** {2:bindres Results}

    The character that represents result types is [&].

    The character that represents operations on errors is [!].*)

val ( let>& ) :
  ('a, 'err) result -> ('a -> ('b, 'err) result) -> ('b, 'err) result
(** [let>? x = y in f x] is [Ok (f v)] if [y = Ok v], and [Error e] if
    [y = Error e].

    I use it to name a result value only if it is valid.*)

val ( let|& ) : ('a, 'err) result -> ('a -> 'b) -> ('b, 'err) result

val ( and*& ) :
  ('a, 'err) result -> ('b, 'err) result -> ('a * 'b, 'err) result

(** {2:bindls Lists}

    The character representing list types is [:]. *)

val ( let>: ) : 'a list -> ('a -> 'b list) -> 'b list

val ( let|: ) : 'a list -> ('a -> 'b) -> 'b list

val ( and*: ) : 'a list -> 'b list -> ('a * 'b) list

(** {1:infix Infix Operators}

    These operators fall into a few categories:

    - Monadic bindings: begin with [>>]
    - Monadic mappings: begin with [>|]
    - Value combinations: wrapped in [<] [>]
    - Structural prependers: begin with [@]
    - Alternatives: begin with [|]*)

(** {2:infopt Options}

    Once again, the character representing option types is [?].*)

val ( >>? ) : 'a option -> ('a -> 'b option) -> 'b option
(** [y >>? (fun x -> f x)] is exactly equivalent to [let>? x = y in f x] *)

val ( >|? ) : 'a option -> ('a -> 'b) -> 'b option

val ( <*?> ) : 'a option -> 'b option -> ('a * 'b) option

val ( |? ) : 'a option -> 'a -> 'a
(** - [Some x |? y] is [x]
    - [None |? y] is [y] *)

(** {2:infres Results}

    For an [('ok,'err) result] type, operators with the character [&]
    transform the ['ok] value, and operators with the character [!]
    transform the ['err] value *)

val ( >>& ) :
  ('a, 'err) result -> ('a -> ('b, 'err) result) -> ('b, 'err) result

val ( >|& ) : ('a, 'err) result -> ('a -> 'b) -> ('b, 'err) result

val ( <*&> ) :
  ('a, 'err) result -> ('b, 'err) result -> ('a * 'b, 'err) result

val ( >|! ) : ('ok, 'a) result -> ('a -> 'b) -> ('ok, 'b) result

val ( <*!> ) : ('ok, 'a) result -> ('ok, 'b) result -> ('ok, 'a * 'b) result

(** {2:infls Lists}

    The character representing list types is [:]. *)

val ( >>: ) : 'a list -> ('a -> 'b list) -> 'b list

val ( >|: ) : 'a list -> ('a -> 'b) -> 'b list

val ( <*:> ) : 'a list -> 'b list -> ('a * 'b) list

val ( @: ) : 'a -> 'a list -> 'a list

val ( @$ ) : 'a -> 'a -> 'a list

val ( @? ) : 'a option -> 'a list -> 'a list

val ( @?$ ) : 'a option -> 'a -> 'a list

val ( @$? ) : 'a -> 'a option -> 'a list

val ( @?? ) : 'a option -> 'a option -> 'a list
