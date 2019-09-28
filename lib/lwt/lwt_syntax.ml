let ( let>% ) x f = Lwt.bind x f

let ( let|% ) x f = Lwt.map f x

let ( and*% ) a b = Lwt.both a b

let ( >>% ) = Lwt.( >>= )

let ( >|% ) = Lwt.( >|= )

let ( <*%> ) a b = Lwt.both a b
