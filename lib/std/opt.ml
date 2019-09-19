let bind = Option.bind

let map x f = Option.map f x

let product a b =
  match (a, b) with Some a, Some b -> Some (a, b) | _ -> None

(* Bindings *****************************************************************)
let ( let>? ) = bind

let ( let|? ) = map

(* Infixes ******************************************************************)
let ( >>? ) = bind

let ( <<? ) f x = bind x f

let ( >|? ) = map

let ( <|? ) f x = map x f

let ( <*?> ) = product

let ( |? ) o def = match o with None -> def | Some x -> x
