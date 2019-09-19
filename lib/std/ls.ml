let bind x f =
  let rec aux return = function
    | [] -> return []
    | x :: l ->
        let return tl =
          match f x with
          | [] -> return tl
          | [x] -> return (x :: tl)
          | [x; y] -> return (x :: y :: tl)
          | l -> return (List.append l tl)
        in
        aux return l
  in
  aux (fun l -> l) x

let map x f = List.map f x

let product = List.combine

(* Bindings *****************************************************************)
let ( let>: ) = bind

let ( and>: ) = product

let ( let|: ) = map

let ( and|: ) = product

(* Infixes ******************************************************************)
let ( >>: ) = bind

let ( <<: ) f x = bind x f

let ( >|: ) = map

let ( <|: ) f x = map x f

let ( <*:> ) = product

(* Cons *********************************************************************)
let ( @: ) x xs = x :: xs

let ( @$ ) x y = [x; y]

let ( @? ) x xs = match x with None -> xs | Some x -> x :: xs

let ( @?$ ) x y = x @? [y]

let ( @$? ) x y = x @: y @? []

let ( @?? ) x y = x @? y @? []
